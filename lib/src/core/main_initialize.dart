import 'package:purus_lern_app/src/core/app_info.dart';
import 'package:purus_lern_app/src/core/firebase/firebase_analytics/log_app_start_event.dart';
import 'package:purus_lern_app/src/core/firebase/initialize_firebase.dart';
import 'package:purus_lern_app/src/core/get_app_info.dart';
import 'package:purus_lern_app/src/core/get_platform_as_string.dart';
import 'package:purus_lern_app/src/core/presentation/rive_manager.dart';
import 'package:purus_lern_app/src/features/authentication/data/shared_pref/faceid_dont_ask_me_again_sharedpred.dart';
import 'package:purus_lern_app/src/features/authentication/data/shared_pref/faceid_sharedpref.dart';
import 'package:purus_lern_app/src/features/authentication/application/local_auth/check_biometric_availability.dart';
import 'package:purus_lern_app/src/features/authentication/application/local_auth/local_auth_service.dart';
import 'package:purus_lern_app/src/features/authentication/data/shared_pref/onboarding_status_sharedpref.dart';
import 'package:purus_lern_app/src/features/authentication/data/shared_pref/stay_logged_in_sharedpref.dart';
import 'package:purus_lern_app/src/features/authentication/data/login_conditions.dart';

Future<void> initializeApp() async {
  currentPlatform = getPlatformAsString();

  await initializeFirebase();

  await RiveManager().initialize();

  // Auth
  isLoggedIn = await StayLoggedInSharedpref().checkLoginStatus();
  isOnboardingNotComplete =
      !await OnboardingStatusSharedpref().isOnboardingDone();
  isFaceIdConfigured = await FaceidSharedpref().getFaceIdAvailability();
  faceIdAskedBeforeAndNo =
      await FaceidDontAskMeAgainSharedpref().getDontAskAgainPreference();
  isDeviceSupportedForBiometric.value =
      await LocalAuthService().isDeviceSupported();
  checkBiometricAvailability();

  await getAppInfo();
  logAppStartEvent();
}
