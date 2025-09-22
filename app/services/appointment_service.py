from sqlalchemy.orm import Session
from app.models.appointment import Appointment
from app.schemas.appointment import AppointmentCreate


def create_appointment(db: Session, appointment_data: AppointmentCreate):
    appointment = Appointment(**appointment_data.dict())
    db.add(appointment)
    db.commit()
    db.refresh(appointment)
    return appointment


def get_appointments(db: Session, user_id: int):
    return db.query(Appointment).filter(Appointment.user_id == user_id).all()
