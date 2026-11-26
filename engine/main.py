"""RoboParking 관제 엔진 (FastAPI)

실행 (RoboParking 폴더에서, 가상환경 켠 상태):
    uvicorn engine.main:app --reload --port 8000
확인: http://localhost:8000/health , API 테스트 화면: http://localhost:8000/docs
"""
import json
from pathlib import Path

from fastapi import FastAPI

MAP_PATH = Path(__file__).resolve().parent.parent / "config" / "map.json"

app = FastAPI(title="RoboParking Engine")


def load_map():
    with open(MAP_PATH, encoding="utf-8") as f:
        return json.load(f)


@app.get("/health")
def health():
    parking_map = load_map()
    return {
        "status": "RoboParking engine OK",
        "slots": len(parking_map["slots"]),
        "robots": parking_map["robot"]["count"],
    }
