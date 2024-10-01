import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/core/firebase/initialize_firebase.dart';
import 'package:purus_lern_app/src/core/presentation/rive_manager.dart';
import 'package:purus_lern_app/src/features/authentication/application/onboarding_status.dart';
import 'package:purus_lern_app/src/features/authentication/application/stay_logged_in.dart';
import 'package:purus_lern_app/src/features/authentication/data/login_conditions.dart';

Future<void> initializeApp() async {
  await initializeFirebase();

  WidgetsFlutterBinding.ensureInitialized();
  await RiveManager().initialize();

  isLoggedIn = await StayLoggedIn().checkLoginStatus();

  isOnboardingNotComplete = !await OnboardingStatus().isOnboardingDone();
}
