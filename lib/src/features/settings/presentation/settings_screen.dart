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
import 'package:url_launcher/url_launcher.dart';

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
    setState(() {
      _isAuthenticating = true;
    });
    bool authenticated = await _localAuthService.authenticateUser();
    setState(() {
      _isAuthenticating = false;
    });
    if (authenticated) {
      if (mounted) {
        setState(() {
          updateFaceId(true);
        });
        if (mounted) {
          mySnackbar(context,
              "Biometrisches Anmeldeverfahren erfolgreich eingerichtet.");
        }
      }
    } else {
      setState(() {
        updateFaceId(false);
      });
      await checkBiometricAvailability();
      if (!isBiometricAvailable) {
        setState(() {});
        if (mounted) {
          mySnackbar(context,
              "Erlaubnis für biometrisches Anmeldeverfahren fehlt. Sie können es jederzeit nach Erlaubniserteilung in den Einstellungen einrichten.");
        }
      } else {
        if (mounted) {
          mySnackbar(context,
              "Fehler bei der Einrichtung. Sie können es jederzeit in den Einstellungen einrichten.");
        }
      }
    }
  }

  Future<void> openBiometricSettings() async {
    if (Theme.of(context).platform == TargetPlatform.android) {
      const url = 'package:com.android.settings.BIOMETRIC_ENROLL';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        await launch('package:com.android.settings');
      }
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      const url = 'App-Prefs:root=FACE_ID';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        await launch('App-Prefs:root');
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
              SizedBox(
                height: 200,
                width: 200,
                child: isBiometricAvailable
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
                                                  color: CupertinoColors
                                                      .activeBlue),
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
                    : isDeviceSupportedForBiometric
                        ? TextButton(
                            onPressed: () {
                              openBiometricSettings();
                            },
                            child: const Text(
                                "Erlaubnis für Biometrisches Anmeldeverfahren erteilen"))
                        : const Text(
                            "Ihr Gerät oder die Platform ist für Biometrische Anmeldeverfahren nicht geeignet"),
              ),
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
