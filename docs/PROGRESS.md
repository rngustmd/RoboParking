# 작업 기록

## 2026-11-26 | Flutter 앱 생성 및 서버 연결 화면

**한 일**
- `flutter create app`으로 Flutter 프로젝트 생성
- 버튼을 누르면 Spring /api/health를 호출해 결과를 보여주는 확인 화면 작성
- 실행 환경별 서버 주소 분리 (에뮬레이터 10.0.2.2, 웹·윈도우 localhost)
- http 패키지 추가, 안드로이드 인터넷 권한·http 통신 허용

**바뀐 파일**
- app/lib/main.dart, app/lib/api_config.dart, app/test/widget_test.dart
- app/pubspec.yaml, app/android/app/src/main/AndroidManifest.xml

**문제와 해결**
- `flutter create` 중 패키지 받기(Resolving dependencies)가 6분 넘게 멈춤 → Ctrl+C 후 app 폴더에서 `flutter pub get`을 다시 실행해 해결
- Spring·Python 엔진 연결은 check_connection.py로 둘 다 OK 확인

**다음 할 일**
- 에뮬레이터에서 앱 실행 후 서버 연결 확인 버튼 테스트
- 시뮬레이션 수치(map.json) 확정, ERD·API 명세 작성 → 1단계 시작

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
