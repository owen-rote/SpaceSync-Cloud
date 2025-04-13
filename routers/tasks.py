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


# Post new task
@router.post("/", response_model=schemas.TaskOut)
def add_task(task: schemas.TaskCreate, db: Session = Depends(get_db)):

    # Format " for JSON payload format
    # task.code = task.code.replace('"', '\\"')

    db_task = models.Task(code=task.code)
    db.add(db_task)
    db.commit()
    db.refresh(db_task)
    return db_task


@router.get("/", response_model=list[schemas.TaskOut])
def list_tasks(db: Session = Depends(get_db)):
    return db.query(models.Task).all()


from fastapi import HTTPException


# Get the next PENDING task from the line. Immediately change to IN_PROGRESS so no dupes get sent
@router.get("/next", response_model=schemas.TaskOut)
def get_next_task(db: Session = Depends(get_db)):
    task = db.query(models.Task).filter_by(status=models.TaskStatus.PENDING).first()
    if not task:
        raise HTTPException(status_code=404, detail="No pending task")

    task.status = models.TaskStatus.IN_PROGRESS  # 'PENDING' -> 'IN_PROGRESS'
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
