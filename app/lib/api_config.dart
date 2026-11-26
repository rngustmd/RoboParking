import 'package:flutter/foundation.dart';

/// Spring 서버 주소.
/// 안드로이드 에뮬레이터에서는 PC의 localhost가 10.0.2.2 입니다.
/// 크롬(웹)이나 윈도우로 실행할 때는 localhost 그대로 씁니다.
class ApiConfig {
  static String get baseUrl {
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.2.2:8080';
    }
    return 'http://localhost:8080';
  }
}
