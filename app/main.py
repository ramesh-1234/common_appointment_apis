# app/main.py
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
from app.api.v1 import auth, users, appointments, doctors

app = FastAPI(title="Common Appointment App API")

@app.get("/")
def read_root():
    return {"message": "Common Appointment App API is running!", "docs": "/docs", "redoc": "/redoc", "status": "active"}

origins = ["*"]  # or ["http://localhost:3000", "http://10.0.2.2:8000"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Register routers
app.include_router(users.router, prefix="/api/v1/users", tags=["Users"])
app.include_router(auth.router, prefix="/api/v1/auth", tags=["Auth"])
app.include_router(appointments.router,
                   prefix="/api/v1/appointments", tags=["Appointments"])

app.include_router(doctors.router, prefix="/api/v1/doctors", tags=["Doctors"])

# static files
app.mount("/uploads", StaticFiles(directory="uploads"), name="uploads")
