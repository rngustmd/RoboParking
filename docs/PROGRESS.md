# 작업 기록

## 2026-11-26 | 환경 구성 및 프로젝트 뼈대

**한 일**
- 폴더 구조 생성 (backend, engine, simulator, config, docs), GitHub 레포 연결
- Spring Boot 4.1.3 프로젝트 생성 (Web, JPA, MySQL, Lombok, WebSocket, Validation, DevTools)
- Spring /api/health, CORS 설정, application-example.properties 추가
- FastAPI 엔진 /health, 연결 확인 스크립트, map.json 초안(주차면 6칸, 로봇 2대) 추가
- CLAUDE.md 작업 규칙 작성

**바뀐 파일**
- backend/.../controller/HealthController.java, backend/.../config/WebConfig.java
- backend/src/main/resources/application-example.properties
- engine/main.py, simulator/check_connection.py, requirements.txt, config/map.json
- CLAUDE.md, README.md, .gitignore

**문제와 해결**
- 없음

**다음 할 일**
- Spring 실행 후 localhost:8080/api/health 확인
- 가상환경 만들고 엔진 실행, check_connection.py로 연결 확인
- `flutter create app` 후 앱에서 /api/health 호출
