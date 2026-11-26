"""세 프로그램 연결 확인용 스크립트 (환경 구성 점검)

실행 (RoboParking 폴더에서, 가상환경 켠 상태):
    python simulator/check_connection.py
"""
import requests

TARGETS = {
    "Spring backend": "http://localhost:8080/api/health",
    "Python engine": "http://localhost:8000/health",
}

for name, url in TARGETS.items():
    try:
        res = requests.get(url, timeout=3)
        print(f"[OK]   {name}: {res.status_code} {res.text}")
    except requests.exceptions.RequestException:
        print(f"[FAIL] {name}: {url} 에 연결할 수 없음 (서버가 켜져 있는지 확인)")
