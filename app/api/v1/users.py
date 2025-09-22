# ✅ File: routes/user.py
import logging
from fastapi import APIRouter, Depends, UploadFile, File, Form, HTTPException, status
from sqlalchemy.orm import Session
from uuid import uuid4
import os
from app.models.user import User
from app.schemas.user import UserOut, UserUpdate
from app.services.user_service import create_user, update_user
from app.deps import get_db

router = APIRouter()
UPLOAD_DIR = "uploads/"
logger = logging.getLogger(__name__)


@router.post("/", response_model=UserOut, status_code=status.HTTP_201_CREATED)
def register_user(
    username: str = Form(...),
    email: str = Form(...),
    password: str = Form(...),
    fullname: str = Form(None),
    nickname: str = Form(None),
    anotheremail: str = Form(None),
    dateofbirth: str = Form(None),
    gender: str = Form(None),
    profile_pic: UploadFile = File(None),
    db: Session = Depends(get_db)
):
    image_path = None
    if profile_pic:
        folder_id = str(uuid4())
        folder_path = os.path.join(UPLOAD_DIR, folder_id)
        os.makedirs(folder_path, exist_ok=True)
        file_ext = os.path.splitext(profile_pic.filename)[-1]
        file_path = os.path.join(folder_path, f"profile{file_ext}")
        with open(file_path, "wb") as f:
            f.write(profile_pic.file.read())
        image_path = file_path.replace("\\", "/")

    return create_user(
        db=db,
        username=username,
        email=email,
        password=password,
        fullname=fullname,
        nickname=nickname,
        anotheremail=anotheremail,
        dateofbirth=dateofbirth,
        gender=gender,
        profile_pic=image_path
    )


@router.put("/edit-profile/{user_id}", response_model=UserOut)
def edit_profile(
    user_id: int,
    fullname: str = Form(None),
    nickname: str = Form(None),
    anotheremail: str = Form(None),
    dateofbirth: str = Form(None),
    gender: str = Form(None),
    profile_pic: UploadFile = File(None),
    db: Session = Depends(get_db)
):
    update_data = {
        "fullname": fullname,
        "nickname": nickname,
        "anotheremail": anotheremail,
        "dateofbirth": dateofbirth,
        "gender": gender,
    }
    update_data = {k: v for k, v in update_data.items() if v is not None}

    image_path = None
    if profile_pic:
        folder_id = str(uuid4())
        folder_path = os.path.join(UPLOAD_DIR, folder_id)
        os.makedirs(folder_path, exist_ok=True)
        file_ext = os.path.splitext(profile_pic.filename)[-1]
        file_path = os.path.join(folder_path, f"profile{file_ext}")
        with open(file_path, "wb") as f:
            f.write(profile_pic.file.read())
        image_path = file_path.replace("\\", "/")

    return update_user(db, user_id=user_id, data=update_data, profile_pic_path=image_path)
