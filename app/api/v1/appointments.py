# app/api/v1/appointments.py

from fastapi import APIRouter, Depends, HTTPException, Path, Query
from sqlalchemy.orm import Session
from typing import List
from datetime import date

from app.deps import get_current_user
from app.models.appointment import Appointment
from app.models.user import User
from app.schemas.appointment import AppointmentCreate, AppointmentOut, NotificationOut
from app.core.database import get_db
from app.services.appointment_service import create_appointment, get_appointments

router = APIRouter()


@router.get("/notifications", response_model=List[NotificationOut])
def get_notifications(
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    appointments = (
        db.query(Appointment)
        .filter(Appointment.user_id == current_user.id)
        .filter(Appointment.status.in_(["completed", "cancelled", "rescheduled"]))
        .order_by(Appointment.updated_at.desc())
        .all()
    )
    return appointments


@router.post("/", response_model=AppointmentOut)
def book_appointment(payload: AppointmentCreate, db: Session = Depends(get_db)):
    return create_appointment(db, payload)


@router.get("/", response_model=List[AppointmentOut])
def list_appointments(user_id: int = Query(...), db: Session = Depends(get_db)):
    return get_appointments(db, user_id)


@router.get("/user/{user_id}", response_model=List[AppointmentOut])
def get_user_appointments(user_id: int, db: Session = Depends(get_db)):
    appointments = db.query(Appointment).filter(
        Appointment.user_id == user_id).all()
    return appointments  # ✅ Remove the 404 raise


@router.patch("/{appointment_id}/cancel", response_model=AppointmentOut)
def cancel_appointment(appointment_id: int, db: Session = Depends(get_db)):
    appointment = db.query(Appointment).get(appointment_id)
    if not appointment:
        raise HTTPException(status_code=404, detail="Appointment not found.")
    appointment.status = "cancelled"
    db.commit()
    db.refresh(appointment)
    return appointment


@router.patch("/{appointment_id}/reschedule", response_model=AppointmentOut)
def reschedule_appointment(
    appointment_id: int,
    new_date: date = Query(...),
    new_time_slot: str = Query(...),
    db: Session = Depends(get_db),
):
    appointment = db.query(Appointment).get(appointment_id)
    if not appointment:
        raise HTTPException(status_code=404, detail="Appointment not found.")
    appointment.date = new_date
    appointment.time_slot = new_time_slot
    db.commit()
    db.refresh(appointment)
    return appointment
