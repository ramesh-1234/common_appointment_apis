from fastapi import APIRouter, Depends, Query
from sqlalchemy.orm import Session
from typing import List
from app.schemas.doctor import DoctorCreate, DoctorOut
from app.services.doctor_service import create_doctor, get_doctors
from app.deps import get_db

router = APIRouter()


@router.post("/", response_model=DoctorOut)
def add_doctor(doctor: DoctorCreate, db: Session = Depends(get_db)):
    return create_doctor(db, doctor)


@router.get("/", response_model=List[DoctorOut])
def list_doctors(
    db: Session = Depends(get_db),
    specialty: str = Query(None),
    location: str = Query(None)
):
    return get_doctors(db, specialty, location)
