import "package:purus_lern_app/src/core/app_info.dart";
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
      "appVersion": appVersion,
      "buildNumber": buildNumber,
      "buildSignature": buildSignature,
      "installerStore": installerStore,
      "isLoggedIn": isLoggedIn.toString(),
      "isOnboardingNotComplete": isOnboardingNotComplete.toString(),
      "isFaceIdConfigured": isFaceIdConfigured.toString(),
      "faceIdAskedBeforeAndNo": faceIdAskedBeforeAndNo.toString(),
      "isBiometricAvailable": isBiometricAvailable.value.toString(),
      "isDeviceSupportedForBiometric":
          isDeviceSupportedForBiometric.value.toString(),
      // "os_version": "12.4.5",
      // "device_model": "iPhone 13 Pro",
      // "app_language": "en",
      // "app_country": "US",
      // "standort": "Berlin",
    },
  );
}
