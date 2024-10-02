import "package:purus_lern_app/src/core/firebase/firebase_analytics/analytics_instance.dart";
import "package:purus_lern_app/src/core/get_platform.dart";
import "package:purus_lern_app/src/features/authentication/data/login_conditions.dart";

Future<void> logAppStartEvent() async {
  String platformName = getPlatformAsString();

  await analytics.logEvent(
    name: "app_started",
    parameters: {
      "description": "App has been launched",
      "platform": platformName,
      "app_version": "1.0.0",
      "isLoggedIn": isLoggedIn.toString(),
      "isOnboardingNotComplete": isOnboardingNotComplete.toString(),
      "isFaceIdAvailable": isFaceIdConfigured.toString(),
      "faceIdAskedBeforeAndNo": faceIdAskedBeforeAndNo.toString(),
      "isDeviceSupportedForBiometric": isDeviceSupportedForBiometric.toString(),
      // "os_version": "12.4.5",
      // "device_model": "iPhone 13 Pro",
      // "app_language": "en",
      // "app_country": "US",
      // "standort": "Berlin",
    },
  );
}
