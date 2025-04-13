from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
import models, schemas
from database import SessionLocal
from typing import List

router = APIRouter()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@router.post("/", response_model=schemas.DeviceOut)
def register_device(device: schemas.DeviceCreate, db: Session = Depends(get_db)):
    db_device = models.Device(name=device.name)
    db.add(db_device)
    db.commit()
    db.refresh(db_device)
    return db_device


@router.get("/", response_model=list[schemas.DeviceOut])
def device_list(db: Session = Depends(get_db)):
    return db.query(models.Device).all()
