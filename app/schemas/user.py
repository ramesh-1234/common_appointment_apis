from pydantic import BaseModel, EmailStr
from typing import Optional


class UserCreate(BaseModel):
    username: str
    email: EmailStr
    password: str
    fullname: Optional[str]
    nickname: Optional[str]
    anotheremail: Optional[EmailStr]
    dateofbirth: Optional[str]
    gender: Optional[str]


class UserUpdate(BaseModel):
    fullname: Optional[str]
    nickname: Optional[str]
    anotheremail: Optional[EmailStr]
    dateofbirth: Optional[str]
    gender: Optional[str]

    class Config:
        orm_mode = True


class UserOut(BaseModel):
    id: int
    username: str
    email: EmailStr
    fullname: Optional[str]
    profile_pic: Optional[str]
    nickname: Optional[str]
    anotheremail: Optional[EmailStr]
    dateofbirth: Optional[str]
    gender: Optional[str]

    class Config:
        orm_mode = True
