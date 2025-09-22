from datetime import datetime, date
from pydantic import BaseModel
from typing import Optional


class AppointmentCreate(BaseModel):
    user_id: int
    doctor_id: int
    date: date
    time_slot: str
    doctor_name: str
    doctor_image: str
    doctor_specialty: str
    doctor_rating: str
    doctor_reviews: int

    class Config:
        orm_mode = True  # Optional but useful if reused in output


class AppointmentOut(AppointmentCreate):
    id: int
    status: str

    class Config:
        orm_mode = True  # ✅ Enables direct return of SQLAlchemy models


class NotificationOut(BaseModel):
    doctor_name: str
    status: str
    updated_at: Optional[datetime] = None

    class Config:
        orm_mode = True  # ✅ Already present and correct
