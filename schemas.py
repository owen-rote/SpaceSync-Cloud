from pydantic import BaseModel
from typing import Optional
from models import TaskStatus


class DeviceCreate(BaseModel):
    name: str


class DeviceOut(BaseModel):
    id: int
    name: str

    class Config:
        orm_mode = True


class TaskCreate(BaseModel):
    code: str


class TaskOut(BaseModel):
    id: int
    code: str
    status: TaskStatus
    result: Optional[str]
    device_id: Optional[int]

    class Config:
        orm_mode = True


class TaskUpdate(BaseModel):
    status: TaskStatus
    result: Optional[str] = None
