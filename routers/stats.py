from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import SessionLocal
import models

router = APIRouter()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@router.get("/")
def cluster_stats(db: Session = Depends(get_db)):
    total_tasks = db.query(models.Task).count()
    completed = (
        db.query(models.Task).filter_by(status=models.TaskStatus.COMPLETE).count()
    )
    in_progress = (
        db.query(models.Task).filter_by(status=models.TaskStatus.IN_PROGRESS).count()
    )
    pending = db.query(models.Task).filter_by(status=models.TaskStatus.PENDING).count()
    devices = db.query(models.Device).count()
    return {
        "devices": devices,
        "tasks": {
            "total": total_tasks,
            "completed": completed,
            "in_progress": in_progress,
            "pending": pending,
        },
    }
