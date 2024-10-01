import 'package:purus_lern_app/src/core/firebase/firebase_analytics/analytics_instance.dart';

Future<void> logLogin(String loginMethod) async {
  await analytics.logLogin(loginMethod: loginMethod);
}
