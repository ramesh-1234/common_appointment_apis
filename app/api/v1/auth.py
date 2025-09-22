import random
from fastapi import APIRouter, Depends, HTTPException, status, Form
from fastapi.security import OAuth2PasswordBearer
from sqlalchemy.orm import Session
from fastapi.responses import JSONResponse
from jose import JWTError, jwt
from datetime import timedelta

from app.core.token import SECRET_KEY, ALGORITHM, create_access_token
from app.services.user_service import authenticate_user, get_user_by_email, get_user_by_id
from app.deps import get_db
from passlib.context import CryptContext
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

router = APIRouter()

# OAuth2 password flow support
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/api/v1/auth/login")
ACCESS_TOKEN_EXPIRE_MINUTES = 60
reset_codes = {}


# -------------------
# 🔐 Login Endpoint
# -------------------
@router.post("/login/", status_code=status.HTTP_200_OK)
def login(
    username_or_email: str = Form(...),
    password: str = Form(...),
    db: Session = Depends(get_db)
) -> JSONResponse:
    user = authenticate_user(db, username_or_email, password)
    if not user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail={"status": "error", "message": "Invalid username or password"}
        )

    token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    token = create_access_token(
        data={"sub": str(user.id)},
        expires_delta=token_expires
    )

    return {
        "status": "success",
        "message": "Login successful",
        "access_token": token,
        "token_type": "bearer",
        "expires_in": ACCESS_TOKEN_EXPIRE_MINUTES * 60  # seconds
    }


# -------------------
# 🙋‍♂️ Get Current User
# -------------------
@router.get("/me", status_code=status.HTTP_200_OK)
def get_me(
    token: str = Depends(oauth2_scheme),
    db: Session = Depends(get_db)
):
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        user_id: str = payload.get("sub")
        if user_id is None:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail={"status": "error", "message": "Invalid token payload"}
            )
    except JWTError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail={"status": "error", "message": "Invalid or expired token"}
        )

    user = get_user_by_id(db, user_id)
    if not user:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail={"status": "error", "message": "User not found"}
        )

    return {
        "status": "success",
        "data": {
            "id": user.id,
            "username": user.username,
            "email": user.email,
            "fullname": user.fullname,
            "profile_pic": user.profile_pic
        }
    }


@router.post("/forgot-password/send-code", status_code=status.HTTP_200_OK)
def send_reset_code(
    email: str = Form(...),
    db: Session = Depends(get_db)
):
    user = get_user_by_email(db, email)
    if not user:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail={"status": "error", "message": "Email not found"},
        )

    code = str(random.randint(100000, 999999))

    # Save code temporarily (in-memory or DB)
    reset_codes[email] = code  # In-memory dict for now

    # TODO: Send email here in production
    print(f"[DEV] Reset code for {email}: {code}")

    return {
        "status": "success",
        "message": "Reset code sent to email",
        "code": code  # ⬅️ Include this only for development
    }


@router.post("/verify-code")
def verify_reset_code(
    email: str = Form(...),
    code: str = Form(...)
):
    if email not in reset_codes or reset_codes[email] != code:
        raise HTTPException(
            status_code=400,
            detail={"status": "error", "message": "Invalid or expired code"}
        )

    return {"status": "success", "message": "Code verified"}


@router.post("/reset-password")
def reset_password(
    email: str = Form(...),
    code: str = Form(...),
    new_password: str = Form(...),
    confirm_password: str = Form(...),
    db: Session = Depends(get_db)
):
    if email not in reset_codes or reset_codes[email] != code:
        raise HTTPException(
            status_code=400,
            detail={"status": "error", "message": "Invalid or expired code"}
        )

    if new_password != confirm_password:
        raise HTTPException(
            status_code=400,
            detail={"status": "error", "message": "Passwords do not match"}
        )

    user = get_user_by_email(db, email)
    if not user:
        raise HTTPException(
            status_code=404,
            detail={"status": "error", "message": "User not found"}
        )

    hashed_pw = pwd_context.hash(new_password)
    user.password = hashed_pw
    db.commit()

    # Clear the used code
    reset_codes.pop(email, None)

    return {"status": "success", "message": "Password reset successful"}
