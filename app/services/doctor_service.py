from sqlalchemy.orm import Session
from app.models.doctor import Doctor
from app.schemas.doctor import DoctorCreate


def create_doctor(db: Session, doctor_data: DoctorCreate):
    doctor = Doctor(**doctor_data.dict())
    db.add(doctor)
    db.commit()
    db.refresh(doctor)
    return doctor


def get_doctors(db: Session, specialty: str = None, location: str = None):
    query = db.query(Doctor)
    if specialty:
        query = query.filter(Doctor.specialty.ilike(f"%{specialty}%"))
    if location:
        query = query.filter(Doctor.location.ilike(f"%{location}%"))
    return query.all()
