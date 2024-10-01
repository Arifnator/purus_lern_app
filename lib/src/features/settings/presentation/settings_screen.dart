import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purus_lern_app/main.dart';
import 'package:purus_lern_app/src/core/main_initialize.dart';
import 'package:purus_lern_app/src/features/authentication/application/faceid_dont_ask_me_again_sharedpred.dart';
import 'package:purus_lern_app/src/features/authentication/application/faceid_sharedpref.dart';
import 'package:purus_lern_app/src/features/authentication/application/local_auth_service.dart';
import 'package:purus_lern_app/src/features/authentication/application/onboarding_status.dart';
import 'package:purus_lern_app/src/features/authentication/application/stay_logged_in.dart';
import 'package:purus_lern_app/src/features/authentication/data/login_conditions.dart';
import 'package:purus_lern_app/src/widgets/my_snack_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final LocalAuthService _localAuthService = LocalAuthService();
  bool _isAuthenticating = false;

  void _restartApp() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const PurusMain()),
      (Route<dynamic> route) => false,
    );
  }

  Future<void> _checkBiometrics() async {
    if (isBiometricAvailable) {
      setState(() {
        _isAuthenticating = true;
      });
      bool authenticated = await _localAuthService.authenticateUser();
      setState(() {
        _isAuthenticating = false;
      });
      if (authenticated) {
        setState(() {
          isFaceIdConfigured = true;
        });
        await FaceidSharedpref().setFaceIdAvailability(true);
      } else {
        if (mounted) {
          mySnackbar(context, "Fehler beim biometrischen Anmeldeverfahren.");
          setState(() {
            isFaceIdConfigured = false;
          });
          await FaceidSharedpref().setFaceIdAvailability(false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
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
              TextButton(
                  onPressed: () {}, child: const Text("Show Onboarding")),
              TextButton(
                  onPressed: () async {
                    isOnboardingNotComplete = true;
                    await OnboardingStatus().setOnboardingStatus(false);
                  },
                  child: const Text("Reset Onboarding")),
              TextButton(
                  onPressed: () async {
                    faceIdAskedBeforeAndNo = false;
                    await FaceidDontAskMeAgainSharedpref()
                        .setDontAskAgainPreference(false);
                  },
                  child: const Text("Reset faceid Dont ask me again")),
              isBiometricAvailable
                  ? isFaceIdConfigured
                      ? TextButton(
                          onPressed: () async {
                            setState(() {
                              _isAuthenticating = true;
                            });
                            showCupertinoDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (context, setDialogState) {
                                    return CupertinoAlertDialog(
                                      title: const Text("Bestätigen"),
                                      content: const Text(
                                        "Möchten Sie das biometrische Anmeldeverfahren ausschalten?",
                                      ),
                                      actions: [
                                        CupertinoDialogAction(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {
                                              _isAuthenticating = false;
                                            });
                                          },
                                          child: const Text(
                                            "Nein",
                                            style: TextStyle(
                                                color: CupertinoColors
                                                    .destructiveRed),
                                          ),
                                        ),
                                        CupertinoDialogAction(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            setState(() {
                                              isFaceIdConfigured = false;
                                              _isAuthenticating = false;
                                            });
                                            await FaceidSharedpref()
                                                .setFaceIdAvailability(false);
                                          },
                                          child: const Text(
                                            "Ja",
                                            style: TextStyle(
                                                color:
                                                    CupertinoColors.activeBlue),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                          child: const Text(
                              "Biometrisches Anmeldeverfahren ausschalten"))
                      : TextButton(
                          onPressed: () {
                            _checkBiometrics();
                          },
                          child: const Text(
                              "Biometrisches Anmeldeverfahren einrichten"))
                  : const SizedBox(),
            ],
          ),
          if (_isAuthenticating)
            Positioned(
              top: 0,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
