import "dart:ui";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_sficon/flutter_sficon.dart";
import "package:purus_lern_app/src/config/palette.dart";
import "package:purus_lern_app/src/core/firebase/firebase_analytics/log_errors.dart";
import "package:purus_lern_app/src/core/firebase/firebase_analytics/log_login.dart";
import "package:purus_lern_app/src/core/presentation/home_screen.dart";
import "package:purus_lern_app/src/features/authentication/application/faceid_dont_ask_me_again_sharedpred.dart";
import "package:purus_lern_app/src/features/authentication/application/faceid_sharedpref.dart";
import "package:purus_lern_app/src/features/authentication/application/local_auth_service.dart";
import "package:purus_lern_app/src/features/authentication/application/stay_logged_in.dart";
import "package:purus_lern_app/src/features/authentication/data/login_conditions.dart";
import "package:purus_lern_app/src/widgets/my_animated_checkmark.dart";
import "package:purus_lern_app/src/widgets/my_button.dart";
import "package:purus_lern_app/src/widgets/my_snack_bar.dart";
import "package:purus_lern_app/src/widgets/my_textfield.dart";

// angemeldet bleiben händeln
// settings faceid einrchtung
// platformbedingt
// möchtne sie faceid nutzen olayi ++ facid nutzen yapinca angemeldet bleiben olmasin?/faceid sadece angemeldet bleiben yerine gecsin??? + log ekle ++ facid in den einstellungen erlauben!!!
// ... neydi?

class LoginPlace extends StatefulWidget {
  const LoginPlace({super.key, required this.transitionToRoute});
  final void Function(String route) transitionToRoute;

  @override
  State<LoginPlace> createState() => _LoginPlaceState();
}

class _LoginPlaceState extends State<LoginPlace> with TickerProviderStateMixin {
  final double _columnSpacing = 20;

  final FocusNode _usernameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  // final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  bool _stayLoggedBox = false;

  bool _isUsernameValid = false;
  bool _isPasswordCorrect = false;

  String _alertText = "Bitte melden Sie sich an.";
  Color _alertTextColor = Colors.white;
  Color _myTextfieldUsernameStrokeColor = purusGrey;
  Color _myTextfieldPassswordStrokeColor = purusGrey;

  late AnimationController _routeAnimationController;
  late Animation<double> _fadeAnimation;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  bool _showSecondAnimation = false;

  final LocalAuthService _localAuthService = LocalAuthService();
  bool _isAuthenticating = false;
  bool _isConfigFaceidDone = false;
  bool _dontAskMeAgain = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _routeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_routeAnimationController);

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _showSecondAnimation = true;
      });
    });
  }

  IconData _showHideIcon() {
    return _obscureText ? SFIcons.sf_eye_fill : SFIcons.sf_eye_slash_fill;
  }

  void _validation() {
    if (_usernameController.text == "admin") {
      _isUsernameValid = true;
      if (_passwordController.text == "0000") {
        _isPasswordCorrect = true;
      }
    }

    _alertTextAndTextfieldStrokeUpdate();

    if (_isUsernameValid && _isPasswordCorrect) {
      logLogin(_usernameController.text.contains("@") ? "email" : "username",
          _stayLoggedBox);

      if (_stayLoggedBox) {
        isLoggedIn = true;
        StayLoggedIn().setLoginStatus(_stayLoggedBox);
      }

      if (isBiometricAvailable &&
          !isFaceIdConfigured &&
          !_isConfigFaceidDone &&
          !faceIdAskedBeforeAndNo) {
        _askConfigFaceIdAfterLogin();
      } else if (isBiometricAvailable && _isConfigFaceidDone) {
        _updateFaceId(true);
        _routeToHomeScreen();
      } else {
        _routeToHomeScreen();
      }
    }
    // if (_formKey.currentState!.validate()) {
    // } else {
    // }
  }

  void _alertTextAndTextfieldStrokeUpdate() {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _alertText = "Fehlende Eingaben";
        _alertTextColor = purusRed;
        if (_usernameController.text.isEmpty) {
          _myTextfieldUsernameStrokeColor = purusRed;
        } else {
          _myTextfieldUsernameStrokeColor = purusGrey;
        }
        if (_passwordController.text.isEmpty) {
          _myTextfieldPassswordStrokeColor = purusRed;
        } else {
          _myTextfieldPassswordStrokeColor = purusGrey;
        }
      });
      logErrors(_alertText);
    } else {
      if (!_isUsernameValid) {
        setState(() {
          _alertText = "Benutzername oder E-Mail nicht gefunden.";
          _alertTextColor = purusRed;
          _myTextfieldUsernameStrokeColor = purusRed;
          _myTextfieldPassswordStrokeColor = purusGrey;
        });
        logErrors(_alertText);
      } else if (_isUsernameValid && !_isPasswordCorrect) {
        setState(() {
          _alertText =
              "Falsches Passwort. Probieren Sie es erneut, oder setzen Sie Ihr Passwort zurück.";
          _alertTextColor = purusRed;
          _myTextfieldUsernameStrokeColor = purusGrey;
          _myTextfieldPassswordStrokeColor = purusRed;
        });
        logErrors(_alertText);
      } else if (_isUsernameValid && _isPasswordCorrect) {
        setState(() {
          _alertText = "Erfolgreich Angemeldet.";
          _alertTextColor = Colors.white;
          _myTextfieldUsernameStrokeColor = purusGrey;
          _myTextfieldPassswordStrokeColor = purusGrey;
        });
      }
    }
  }

  void _askConfigFaceIdAfterLogin() {
    setState(() {
      _isAuthenticating = true;
    });
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return CupertinoAlertDialog(
              title: const Text("Erfolgreich Angemeldet"),
              content: Column(
                children: [
                  const Text(
                    "Möchten Sie biometrisches Anmeldeverfahren einrichten?",
                  ),
                  const SizedBox(height: 10),
                  Material(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: purusGreen,
                          value: _dontAskMeAgain,
                          onChanged: (bool? value) {
                            setDialogState(() {
                              _dontAskMeAgain = value ?? false;
                            });
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            setDialogState(() {
                              _dontAskMeAgain = !_dontAskMeAgain;
                            });
                          },
                          child: const Text(
                            "Nicht erneut fragen",
                            style:
                                TextStyle(fontFamily: "SF Pro", fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    setState(() {
                      _isAuthenticating = false;
                    });
                    Navigator.pop(context);
                    _routeToHomeScreen();
                    _updateFaceId(false);

                    if (_dontAskMeAgain) {
                      FaceidDontAskMeAgainSharedpref()
                          .setDontAskAgainPreference(true);
                    }

                    if (mounted) {
                      mySnackbar(context,
                          "Sie können biometrisches Anmeldeverfahren jederzeit in den Einstellungen einrichten.");
                    }
                  },
                  child: const Text(
                    "Nein",
                    style: TextStyle(color: CupertinoColors.destructiveRed),
                  ),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                    _checkBiometricsAfterLogin();

                    if (_dontAskMeAgain) {
                      FaceidDontAskMeAgainSharedpref()
                          .setDontAskAgainPreference(true);
                    }
                  },
                  child: const Text(
                    "Ja",
                    style: TextStyle(color: CupertinoColors.activeBlue),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _checkBiometricsAfterLogin() async {
    setState(() {
      _isAuthenticating = true;
    });
    bool authenticated = await _localAuthService.authenticateUser();
    setState(() {
      _isAuthenticating = false;
    });
    if (authenticated) {
      if (mounted) {
        _routeToHomeScreen();
        _updateFaceId(true);
      }
    } else {
      if (mounted) {
        _routeToHomeScreen();
        _updateFaceId(false);
        mySnackbar(context,
            "Fehler bei der Einrichtung. Sie können es jederzeit in den Einstellungen einrichten.");
      }
    }
  }

  void _askConfigFaceId() {
    setState(() {
      _isAuthenticating = true;
    });
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: const Text(
              "Möchten Sie biometrisches Anmeldeverfahren einrichten?"),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                setState(() {
                  _isAuthenticating = false;
                  _isConfigFaceidDone = false;
                });
                Navigator.pop(context);
                if (mounted) {
                  mySnackbar(context,
                      "Sie können biometrisches Anmeldeverfahren jederzeit in den Einstellungen einrichten.");
                }
              },
              child: const Text(
                "Nein",
                style: TextStyle(color: CupertinoColors.destructiveRed),
              ),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
                _checkBiometrics();
              },
              child: const Text(
                "Ja",
                style: TextStyle(color: CupertinoColors.activeBlue),
              ),
            ),
          ],
        );
      },
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
      setState(() {
        _isConfigFaceidDone = true;
      });
    } else {
      if (mounted) {
        setState(() {
          _isConfigFaceidDone = false;
        });
        mySnackbar(context, "Fehler beim biometrischen Anmeldeverfahren.");
      }
    }
  }

  void _updateFaceId(bool value) async {
    isFaceIdConfigured = value;
    FaceidSharedpref sharedPrefFaceid = FaceidSharedpref();
    await sharedPrefFaceid.setFaceIdAvailability(value);
  }

  void _routeToHomeScreen() async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (mounted) {
      _routeAnimationController.forward();
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: const HomeScreen(),
            );
          },
          transitionDuration: const Duration(milliseconds: 1200),
        ),
      );
    }
  }

  @override
  void dispose() {
    _usernameNode.dispose();
    _passwordNode.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _animationController.dispose();
    _routeAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0.0;

    return SizedBox.expand(
        child: Stack(
      children: [
        Positioned(
          top: 0,
          child: SizedBox(
            width: 393,
            child:
                // Form(
                //   key: _formKey,
                //   child:
                SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 45,
                      child: Center(
                        child: Text(
                          _alertText,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: _alertTextColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _columnSpacing,
                    ),
                    MyTextfield(
                      controller: _usernameController,
                      hintText: "Benutzername oder E-Mail",
                      focusNode: _usernameNode,
                      strokeColor: _myTextfieldUsernameStrokeColor,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.continueAction,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],
                      // icon: const Icon(Icons.email, color: purusGreen),
                      onSubmitted: (p0) {
                        FocusScope.of(context).requestFocus(_passwordNode);
                      },
                    ),
                    SizedBox(
                      height: _columnSpacing,
                    ),
                    MyTextfield(
                      controller: _passwordController,
                      hintText: "Passwort",
                      focusNode: _passwordNode,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],
                      obscureText: _obscureText,
                      strokeColor: _myTextfieldPassswordStrokeColor,
                      keyboardType: TextInputType.visiblePassword,
                      suffix: GestureDetector(
                        onTapDown: (_) {
                          setState(() {
                            _obscureText = false;
                            _showHideIcon();
                          });
                        },
                        onTapUp: (_) {
                          setState(() {
                            _obscureText = true;
                            _showHideIcon();
                          });
                        },
                        child: SFIcon(
                          _showHideIcon(),
                          color: purusGrey,
                          fontSize: 16,
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                      // maxLength: 20,
                      onSubmitted: (p0) {
                        _validation();
                        // FocusManager.instance.primaryFocus?.unfocus();
                      },
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Please enter some text";
                      //   }
                      //   return "jkdejd";
                      // },
                    ),
                    SizedBox(
                      height: _columnSpacing,
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 6,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _stayLoggedBox = !_stayLoggedBox;
                              });
                            },
                            child: _stayLoggedBox
                                ? const SFIcon(
                                    SFIcons.sf_checkmark_square_fill,
                                    color: Colors.white,
                                    fontSize: 19,
                                  )
                                : const SFIcon(
                                    SFIcons.sf_square,
                                    color: Colors.white,
                                    fontSize: 19,
                                  ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _stayLoggedBox = !_stayLoggedBox;
                              });
                            },
                            child: const Text(
                              "Angemeldet bleiben",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.transitionToRoute("ForgotPassword");
                              });
                            },
                            child: const Text(
                              "Passwort vergessen?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _columnSpacing,
                    ),
                    AnimatedOpacity(
                      opacity: _showSecondAnimation ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: Column(
                        children: [
                          MyButton(
                            onTap: () {
                              _validation();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            text: "Anmelden",
                          ),
                          SizedBox(
                            height: _columnSpacing,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: const Divider(
                                      color: Colors.white,
                                      thickness: 0.7,
                                    )),
                              ),
                              const Text("oder",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  )),
                              Expanded(
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 20.0, right: 20),
                                    child: const Divider(
                                      color: Colors.white,
                                      thickness: 0.7,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _columnSpacing,
                          ),
                          MyButton(
                            onTap: () {
                              widget.transitionToRoute("Registration");
                            },
                            text: "Registrieren",
                            bgColor: Colors.white,
                            textColor: purusGreen,
                            strokeColor: borderStrokeGrey,
                          ),
                          SizedBox(
                            height: _columnSpacing,
                          ),
                          // if (!isKeyboardVisible)
                          isBiometricAvailable
                              ? GestureDetector(
                                  onTap: () {
                                    if (isFaceIdConfigured) {
                                      _checkBiometricsAfterLogin();
                                    } else {
                                      _askConfigFaceId();
                                    }
                                  },
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      ScaleTransition(
                                        scale: _scaleAnimation,
                                        child: SizedBox(
                                          height: 90,
                                          child: Image.asset(
                                              "assets/images/FaceID.png"),
                                        ),
                                      ),
                                      _isConfigFaceidDone
                                          ? const Positioned(
                                              top: -5,
                                              right: 0,
                                              child: MyAnimatedCheckmark())
                                          : const SizedBox(),
                                      const Positioned(
                                        bottom: 7,
                                        left: 23,
                                        child: SizedBox(
                                          child: Text(
                                            "Face ID",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : const SizedBox(
                                  height: 90,
                                ),

                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
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
    )
        //     ),
        );
  }
}
