import 'package:flutter/material.dart';
import 'package:purus_lern_app/main.dart';
import 'package:purus_lern_app/src/core/main_initialize.dart';
import 'package:purus_lern_app/src/features/authentication/application/faceid_dont_ask_me_again_sharedpred.dart';
import 'package:purus_lern_app/src/features/authentication/application/faceid_sharedpref.dart';
import 'package:purus_lern_app/src/features/authentication/application/onboarding_status.dart';
import 'package:purus_lern_app/src/features/authentication/application/stay_logged_in.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _restartApp() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const PurusMain()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () async {
              await StayLoggedIn().logout();
              if (mounted) {
                await initializeApp();
              }
              if (mounted) {
                _restartApp();
              }
            },
            child: const Text("Logut")),
        TextButton(onPressed: () {}, child: const Text("Show Onboarding")),
        TextButton(
            onPressed: () async {
              await OnboardingStatus().setOnboardingStatus(false);
            },
            child: const Text("Reset Onboarding")),
        TextButton(
            onPressed: () async {
              await FaceidSharedpref().setFaceIdAvailability(false);
            },
            child: const Text("Reset FaceID")),
        TextButton(
            onPressed: () async {
              await FaceidDontAskMeAgainSharedpref()
                  .setDontAskAgainPreference(false);
            },
            child: const Text("Reset faceid Dont ask me again")),
        TextButton(
            onPressed: () {},
            child: const Text("Biometrisches Anmeldeverfahren einrichten")),
      ],
    );
  }
}
