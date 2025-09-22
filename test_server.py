from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="Test Common Appointment App API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def read_root():
    return {"message": "Test API is running!", "status": "active"}

@app.get("/test")
def test_endpoint():
    return {"message": "Test endpoint working!", "data": "Hello World"}

@app.get("/api/v1/doctors/")
def get_doctors():
    return {"doctors": [
        {"id": 1, "name": "Dr. John Smith", "specialty": "Cardiologist"},
        {"id": 2, "name": "Dr. Jane Doe", "specialty": "Dermatologist"}
    ]}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8001)
