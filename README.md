# RoboParking

공동주택 주차 로봇 관제 및 운영 시뮬레이션 시스템

로봇 대수와 상관없이 무사고·고효율로 입출차를 처리하는 관제 소프트웨어입니다. 물류창고 AMR 관제의 핵심 문제(작업 배정, 동선 충돌, 배터리 관리)를 주차 도메인에 적용해 검증합니다.

## 기술 스택
- Flutter: 관제 화면, 입주민 요청
- Spring Boot + JPA + MySQL: 업무 시스템
- Python FastAPI: 관제 엔진
- Python: 시뮬레이터, 로그 분석

## 실행 방법
1. Spring: `backend/src/main/resources/application-example.properties`를 복사해 `application.properties`로 만들고 비밀번호 입력 → `backend`에서 `.\gradlew bootRun`
2. Python: `RoboParking`에서 `python -m venv venv` → `venv\Scripts\activate` → `pip install -r requirements.txt` → `uvicorn engine.main:app --reload --port 8000`
3. 연결 확인: `python simulator/check_connection.py`

(개발 진행 중)
