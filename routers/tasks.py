from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
import models, schemas
from database import SessionLocal

router = APIRouter()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@router.post("/", response_model=schemas.TaskOut)
def add_task(task: schemas.TaskCreate, db: Session = Depends(get_db)):
    db_task = models.Task(code=task.code)
    db.add(db_task)
    db.commit()
    db.refresh(db_task)
    return db_task


@router.get("/", response_model=list[schemas.TaskOut])
def list_tasks(db: Session = Depends(get_db)):
    return db.query(models.Task).all()


@router.get("/next", response_model=schemas.TaskOut)
def get_next_task(db: Session = Depends(get_db)):
    task = db.query(models.Task).filter_by(status=models.TaskStatus.PENDING).first()
    if not task:
        raise HTTPException(status_code=404, detail="No pending task")
    return task


@router.put("/{task_id}/claim", response_model=schemas.TaskOut)
def claim_task(task_id: int, device_id: int, db: Session = Depends(get_db)):
    task = db.query(models.Task).get(task_id)
    if not task:
        raise HTTPException(status_code=404, detail="Task not found")
    task.status = models.TaskStatus.IN_PROGRESS
    task.device_id = device_id
    db.commit()
    db.refresh(task)
    return task


@router.put("/{task_id}/complete", response_model=schemas.TaskOut)
def complete_task(
    task_id: int, update: schemas.TaskUpdate, db: Session = Depends(get_db)
):
    task = db.query(models.Task).get(task_id)
    if not task:
        raise HTTPException(status_code=404, detail="Task not found")
    task.status = update.status
    task.result = update.result
    db.commit()
    db.refresh(task)
    return task


@router.delete("/{task_id}")
def delete_task(task_id: int, db: Session = Depends(get_db)):
    task = db.query(models.Task).get(task_id)
    if not task:
        raise HTTPException(status_code=404, detail="Task not found")
    db.delete(task)
    db.commit()
    return {"message": "Task deleted"}
