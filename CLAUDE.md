# RoboParking 작업 규칙 (AI용)

## 프로젝트 요약
- 공동주택 주차 로봇 관제 소프트웨어. 목표는 로봇 대수와 상관없이 **무사고·고효율** 입출차 처리.
- 가상 입주민·차량·출퇴근 패턴으로 시뮬레이션을 돌려 관제 성능을 수치로 검증한다.
- 기획서: https://claude.ai/artifact/3KknsCHM7E1sFxTjw7CM61

## 구조와 역할
| 폴더 | 기술 | 역할 | 포트 |
| --- | --- | --- | --- |
| backend/ | Spring Boot 4.1, Java 17, JPA, MySQL | 업무 시스템: CRUD, 로그 저장, 통계, Flutter의 유일한 창구, WebSocket | 8080 |
| engine/ | Python FastAPI | 관제 엔진(두뇌): 작업 배정, 칸 예약, 충전 판단 | 8000 |
| simulator/ | Python | 가상 현실: 요청 발생, 로봇 이동·배터리 변화 | - |
| app/ | Flutter | 관제 지도·로그·통계, 입주민 요청 화면 | - |
| config/map.json | JSON | 주차장 맵·로봇 설정 (세 프로그램이 함께 읽음) | - |

## 반드시 지킬 원칙
- 판단(배정·경로·충돌 방지·충전)은 **engine에서만** 한다. simulator는 명령대로 움직이기만 한다.
- Flutter는 Spring만 호출한다. engine을 직접 부르지 않는다.
- 맵·로봇 수치는 코드에 박지 말고 config/map.json에서 읽는다.
- 상태값은 문자열 대신 enum을 쓴다 (예: 로봇 상태, 작업 상태).
- 실패 응답은 ResponseEntity로 상태 코드와 에러 메시지를 함께 보낸다.
- 필드 이름은 세 프로그램이 같게 맞춘다. 새 API를 만들면 아래 API 목록에 추가한다.
- 에뮬레이터에서 Spring 주소는 http://10.0.2.2:8080 이다. 앱의 서버 주소는 app/lib/api_config.dart 한 곳에서만 관리한다.
- 이 Flutter 버전은 `package:material_ui/material_ui.dart`를 쓴다 (`package:flutter/material.dart` 아님).
- application.properties(비밀번호)는 커밋하지 않는다. 설정이 바뀌면 application-example.properties도 함께 고친다.

## API 목록
| 서버 | 메서드 | 경로 | 설명 |
| --- | --- | --- | --- |
| Spring | GET | /api/health | 서버 상태 확인 |
| engine | GET | /health | 엔진 상태 + 맵 요약 |

## 작업 보고 규칙
- 작업 하나를 끝낼 때마다 docs/PROGRESS.md 맨 위에 아래 형식으로 기록한다.
- 기존 기록은 지우거나 수정하지 않는다.
- 에러가 났다가 해결한 경우 원인과 해결 방법을 반드시 적는다.
- 핵심 로직(배정, 칸 예약, 충전)을 바꿨다면 동작 원리를 3줄 이내로 설명한다.

```
## YYYY-MM-DD | 작업 제목

**한 일**
-

**바뀐 파일**
-

**문제와 해결**
- (없으면 없음)

**다음 할 일**
-
```
