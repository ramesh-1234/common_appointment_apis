from sqlalchemy import Column, Integer, String
from app.core.database import Base


class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    username = Column(String(50), unique=True, nullable=False)
    email = Column(String(100), unique=True, nullable=False)
    password = Column(String(255), nullable=False)
    fullname = Column(String(100))
    profile_pic = Column(String(255))  # stores image path
    nickname = Column(String(50))
    anotheremail = Column(String(100))
    dateofbirth = Column(String(50))
    gender = Column(String(10))
