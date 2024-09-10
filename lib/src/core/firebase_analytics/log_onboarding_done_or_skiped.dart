import 'package:purus_lern_app/src/core/firebase_analytics/analytics_instance.dart';

Future<void> logOnboardingDone() async {
  await analytics.logEvent(
    name: 'onboarding_done',
    parameters: {
      'description': 'Onboarding has been completed',
    },
  );
}

Future<void> logOnboardingSkipped() async {
  await analytics.logEvent(
    name: 'onboarding_skipped',
    parameters: {
      'description': 'Onboarding has been skipped',
    },
  );
}
