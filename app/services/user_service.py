# ✅ File: services/user_service.py
from sqlalchemy.orm import Session
from app.models.user import User
from fastapi import HTTPException, status
from passlib.hash import bcrypt


def authenticate_user(db, username_or_email: str, password: str):
    user = db.query(User).filter(
        (User.username == username_or_email) | (
            User.email == username_or_email)
    ).first()
    if not user or not bcrypt.verify(password, user.password):
        return None
    return user


def create_user(db: Session, username, email, password, fullname, nickname,
                anotheremail, dateofbirth, gender, profile_pic):
    existing_user = db.query(User).filter(
        (User.email == email) | (User.username == username)).first()
    if existing_user:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST,
                            detail="Username or email already exists")

    hashed_pw = bcrypt.hash(password)

    new_user = User(
        username=username,
        email=email,
        password=hashed_pw,
        fullname=fullname,
        profile_pic=profile_pic,
        nickname=nickname,
        anotheremail=anotheremail,
        dateofbirth=dateofbirth,
        gender=gender
    )

    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    return new_user


def update_user(db: Session, user_id: int, data: dict, profile_pic_path: str | None = None):
    user = db.query(User).filter(User.id == user_id).first()
    if not user:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="User not found")

    for field, value in data.items():
        setattr(user, field, value)

    if profile_pic_path:
        user.profile_pic = profile_pic_path

    db.commit()
    db.refresh(user)
    return user


def get_user_by_id(db: Session, user_id: int):
    return db.query(User).filter(User.id == user_id).first()


def get_user_by_email(db: Session, email: str) -> User | None:
    return db.query(User).filter(User.email == email).first()
