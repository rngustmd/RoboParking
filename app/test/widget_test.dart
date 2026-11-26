import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

void main() {
  testWidgets('첫 화면에 서버 연결 확인 버튼이 보인다', (WidgetTester tester) async {
    await tester.pumpWidget(const RoboParkingApp());

    expect(find.text('RoboParking'), findsOneWidget);
    expect(find.text('서버 연결 확인'), findsOneWidget);
  });
}
