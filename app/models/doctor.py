from sqlalchemy import Column, Integer, String, Float
from app.core.database import Base


class Doctor(Base):
    __tablename__ = "doctors"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(255), nullable=False)
    specialty = Column(String(255), nullable=False)
    rating = Column(Float, default=0.0)
    location = Column(String(255), nullable=False)
    image_url = Column(String(500), nullable=True)
    review_count = Column(Integer, default=0)
