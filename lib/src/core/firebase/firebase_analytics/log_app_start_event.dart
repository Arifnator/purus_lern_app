import 'package:purus_lern_app/src/core/firebase/firebase_analytics/analytics_instance.dart';
import 'package:purus_lern_app/src/core/get_platform.dart';

Future<void> logAppStartEvent() async {
  String platformName = getPlatformAsString();

  await analytics.logEvent(
    name: 'app_started',
    parameters: {
      'description': 'App has been launched',
      'platform': platformName,
    },
  );
}
