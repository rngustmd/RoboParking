import 'package:http/http.dart' as http;
import 'package:material_ui/material_ui.dart';

import 'api_config.dart';

void main() {
  runApp(const RoboParkingApp());
}

class RoboParkingApp extends StatelessWidget {
  const RoboParkingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RoboParking',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)),
      home: const HealthCheckPage(),
    );
  }
}

/// 환경 구성 확인용 화면: 버튼을 누르면 Spring /api/health 를 호출해 결과를 보여준다.
class HealthCheckPage extends StatefulWidget {
  const HealthCheckPage({super.key});

  @override
  State<HealthCheckPage> createState() => _HealthCheckPageState();
}

class _HealthCheckPageState extends State<HealthCheckPage> {
  String _result = '아직 확인하지 않았어요';
  bool _loading = false;

  Future<void> _checkServer() async {
    setState(() => _loading = true);
    final url = Uri.parse('${ApiConfig.baseUrl}/api/health');
    try {
      final res = await http.get(url).timeout(const Duration(seconds: 5));
      setState(() => _result = '${res.statusCode} ${res.body}');
    } catch (e) {
      setState(() => _result = '연결 실패: $url\n$e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RoboParking')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('서버: ${ApiConfig.baseUrl}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loading ? null : _checkServer,
                child: Text(_loading ? '확인 중...' : '서버 연결 확인'),
              ),
              const SizedBox(height: 16),
              Text(_result, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
