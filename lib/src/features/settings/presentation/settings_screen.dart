import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/core/get_app_info.dart';
import 'package:purus_lern_app/src/features/authentication/data/shared_pref/faceid_dont_ask_me_again_sharedpred.dart';
import 'package:purus_lern_app/src/features/authentication/data/shared_pref/faceid_sharedpref.dart';
import 'package:purus_lern_app/src/features/authentication/application/go_to_biometric_settings.dart';
import 'package:purus_lern_app/src/features/authentication/application/local_auth/check_biometric_availability.dart';
import 'package:purus_lern_app/src/features/authentication/application/local_auth/local_auth_service.dart';
import 'package:purus_lern_app/src/features/authentication/application/local_auth/refresh_biometric_state.dart';
import 'package:purus_lern_app/src/features/authentication/application/logout.dart';
import 'package:purus_lern_app/src/features/authentication/data/shared_pref/onboarding_status_sharedpref.dart';
import 'package:purus_lern_app/src/features/authentication/data/login_conditions.dart';
import 'package:purus_lern_app/src/widgets/my_snack_bar.dart';

// app version yaz + splash auch??

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final LocalAuthService _localAuthService = LocalAuthService();
  bool _isAuthenticating = false;

  Future<void> _checkBiometrics() async {
    try {
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
        if (!isBiometricAvailable.value) {
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
    } catch (e) {
      debugPrint(e.toString());
      if (mounted) {
        mySnackbar(context,
            "Fehler bei der Einrichtung. Sie können es jederzeit in den Einstellungen einrichten.");
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
                  onPressed: () {
                    getAppInfo();
                  },
                  child: Text("get app info")),
              TextButton(
                  onPressed: () {
                    goToBiometricSettings(context);
                  },
                  child: Text("erlaubnis für biometrische anmeldung")),
              TextButton(
                  onPressed: () {
                    refreshBiometricState(context, mounted, true);
                  },
                  child: Text(
                      "Refresh biometric state / App Neustarten hinweisen?")),
              TextButton(
                  onPressed: () {
                    logout(context);
                  },
                  child: const Text("Logout")),
              TextButton(
                  onPressed: () {}, child: const Text("Show Onboarding")),
              TextButton(
                  onPressed: () async {
                    isOnboardingNotComplete = true;
                    await OnboardingStatusSharedpref()
                        .setOnboardingStatusSharedpref(false);
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
                height: 300,
                width: 200,
                child: ValueListenableBuilder<bool>(
                  valueListenable: isBiometricAvailable,
                  builder: (context, value, child) {
                    if (value) {
                      if (isFaceIdConfigured) {
                        return TextButton(
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
                                "Biometrisches Anmeldeverfahren ausschalten"));
                      } else {
                        return TextButton(
                            onPressed: () {
                              _checkBiometrics();
                            },
                            child: const Text(
                                "Biometrisches Anmeldeverfahren einrichten"));
                      }
                    } else {
                      return ValueListenableBuilder<bool>(
                          valueListenable: isDeviceSupportedForBiometric,
                          builder: (context, value, child) {
                            if (value) {
                              return TextButton(
                                  onPressed: () {
                                    goToBiometricSettings(
                                      context,
                                    );
                                  },
                                  child: const Text(
                                      "Erlaubnis für biometrisches Anmeldeverfahren erteilen"));
                            } else {
                              return Column(
                                children: [
                                  Text(
                                      "Ihr Gerät oder die Platform ist für biometrische Anmeldeverfahren nicht geeignet oder ausgeschaltet."),
                                  TextButton(
                                      onPressed: () {
                                        goToBiometricSettings(context);
                                      },
                                      child: const Text("Zu den Einstellungen"))
                                ],
                              );
                            }
                          });
                    }
                  },
                ),
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
