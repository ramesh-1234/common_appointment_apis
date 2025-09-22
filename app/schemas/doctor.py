from pydantic import BaseModel
from typing import Optional


class DoctorBase(BaseModel):
    name: str
    specialty: str
    rating: float
    location: str
    image_url: Optional[str]
    review_count: int


class DoctorCreate(DoctorBase):
    pass


class DoctorOut(DoctorBase):
    id: int

    class Config:
        orm_mode = True
