from datetime import datetime
from sqlalchemy import Column, DateTime, Integer, String, Date, ForeignKey
from sqlalchemy.orm import relationship
from app.core.database import Base


class Appointment(Base):
    __tablename__ = "appointments"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, nullable=False)
    doctor_id = Column(Integer, ForeignKey("doctors.id"), nullable=False)
    date = Column(Date, nullable=False)
    time_slot = Column(String(20), nullable=False)

    # Static doctor details
    doctor_name = Column(String(100), nullable=False)
    doctor_image = Column(String(255), nullable=True)
    doctor_specialty = Column(String(100), nullable=False)
    doctor_rating = Column(String(10), nullable=False)
    doctor_reviews = Column(String(20), nullable=False)
    status = Column(String(20), default="upcoming")
    updated_at = Column(DateTime, default=datetime.utcnow,
                        onupdate=datetime.utcnow)

    doctor = relationship("Doctor")
