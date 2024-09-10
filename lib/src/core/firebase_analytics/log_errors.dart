import 'package:purus_lern_app/src/core/firebase_analytics/analytics_instance.dart';

Future<void> logErrors(String e) async {
  await analytics.logEvent(
    name: 'error_occurred',
    parameters: {
      'error_message': e,
    },
  );
}
