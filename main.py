from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routers import devices, tasks, stats
from database import Base, engine

Base.metadata.create_all(bind=engine)

app = FastAPI(
    title="SpaceSync Cloud Orchestrator",
    description="REST API for distributed compute tasks on iPhones",
    version="1.0.0",
)


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(devices.router, prefix="/devices", tags=["Devices"])
app.include_router(tasks.router, prefix="/tasks", tags=["Tasks"])
app.include_router(stats.router, prefix="/stats", tags=["Stats"])


@app.get("/")
def root():
    return {"message": "iPhone Cluster Orchestrator API"}
