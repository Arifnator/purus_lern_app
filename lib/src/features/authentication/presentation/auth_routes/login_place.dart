import 'package:flutter/material.dart';
import 'package:flutter_sficon/flutter_sficon.dart';
import 'package:purus_lern_app/src/config/palette.dart';
import 'package:purus_lern_app/src/features/authentication/data/log_errors.dart';
import 'package:purus_lern_app/src/core/firebase/firebase_analytics/log_login.dart';
import 'package:purus_lern_app/src/features/authentication/data/login_conditions.dart';
import 'package:purus_lern_app/src/widgets/my_button.dart';
import 'package:purus_lern_app/src/widgets/my_textfield.dart';

// fehlermeldung rot fln...
// iki parca acilsin???
// https://docs.flutter.dev/cookbook/forms/validation
// scrollbar und flex
// alle fehler
// falxhce eingaben rot
// gesture detecotr keyborad + anmelden cakisiyor
// unfocus on button2
// back button passw forgot and reg all
// sozial login???
// angemeldet bleiben sharedpref?
// bei registrieren soll email mitgegeben werden

class LoginPlace extends StatefulWidget {
  const LoginPlace({super.key, required this.transitionToRoute});
  final void Function(String route) transitionToRoute;

  @override
  State<LoginPlace> createState() => _LoginPlaceState();
}

class _LoginPlaceState extends State<LoginPlace>
    with SingleTickerProviderStateMixin {
  final double _columnSpacing = 20;

  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  bool stayLoggedBox = false;

  bool isUsernameValid = false;
  bool isPasswordCorrect = false;

  String _alertText = "Bitte melden Sie sich an.";
  Color _alertTextColor = Colors.white;

  void _alertTextUpdate() {
    if (!isUsernameValid) {
      setState(() {
        _alertText = "Benutzername oder E-Mail nicht gefunden.";
        _alertTextColor = purusRed;
      });
      logErrors(_alertText);
    } else if (isUsernameValid && !isPasswordCorrect) {
      setState(() {
        _alertText =
            "Falsches Passwort. Probieren Sie es erneut, oder setzen Sie Ihr Passwort zurück.";
        _alertTextColor = purusRed;
      });
      logErrors(_alertText);
    }
  }

  // late AnimationController _routeAnimationController;
  // late Animation<double> _fadeAnimation;

  IconData showHideIcon() {
    return obscureText ? SFIcons.sf_eye_fill : SFIcons.sf_eye_slash_fill;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _routeAnimationController = AnimationController(
  //     duration: const Duration(milliseconds: 1200),
  //     vsync: this,
  //   );
  //   _fadeAnimation =
  //       Tween<double>(begin: 0.0, end: 1.0).animate(_routeAnimationController);
  // }

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

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
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusNode nodeOne = FocusNode();
    FocusNode nodeTwo = FocusNode();

    // bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0.0;

    return SizedBox.expand(
      child: SizedBox(
        width: 340,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                    controller: usernameController,
                    hintText: "Benutzername oder E-Mail",
                    focusNode: nodeOne,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.continueAction,
                    // icon: const Icon(Icons.email, color: purusGreen),
                    onSubmitted: (p0) {
                      FocusScope.of(context).requestFocus(nodeTwo);
                    },
                  ),
                  SizedBox(
                    height: _columnSpacing,
                  ),
                  MyTextfield(
                    controller: passwordController,
                    hintText: "Passwort",
                    focusNode: nodeTwo,
                    obscureText: obscureText,
                    keyboardType: TextInputType.visiblePassword,
                    suffix: GestureDetector(
                      onTapDown: (_) {
                        setState(() {
                          obscureText = false;
                          showHideIcon();
                        });
                      },
                      onTapUp: (_) {
                        setState(() {
                          obscureText = true;
                          showHideIcon();
                        });
                      },
                      child: SFIcon(
                        showHideIcon(),
                        color: purusGrey,
                        fontSize: 16,
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    // maxLength: 20,
                    onSubmitted: (p0) {
                      _alertTextUpdate();

                      if (true) {
                        logLogin(usernameController.text.contains('@')
                            ? "email"
                            : "username");
                      }
                    },
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter some text';
                    //   }
                    //   return null;
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
                              stayLoggedBox = !stayLoggedBox;
                            });
                          },
                          child: stayLoggedBox
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
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              stayLoggedBox = !stayLoggedBox;
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
                              widget.transitionToRoute('ForgotPassword');
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
                          width: 6,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _columnSpacing,
                  ),
                  MyButton(
                    onTap: () {
                      _alertTextUpdate();
                      FocusManager.instance.primaryFocus?.unfocus();
                      // if (_formKey.currentState!.validate()) {

                      //   // Navigator.of(context).pushReplacement(
                      //   //   PageRouteBuilder(
                      //   //     pageBuilder: (context, animation, secondaryAnimation) {
                      //   //       return FadeTransition(
                      //   //         opacity: _fadeAnimation,
                      //   //         child: const HomeScreen(),
                      //   //       );
                      //   //     },
                      //   //     transitionDuration: const Duration(milliseconds: 1200),
                      //   //   ),
                      //   // );
                      // } else {

                      //   // ScaffoldMessenger.of(context).showSnackBar(
                      //   //   const SnackBar(content: Text('Please fill input')),
                      //   // );
                      // }
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
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
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
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20),
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
                      FocusManager.instance.primaryFocus?.unfocus();
                      widget.transitionToRoute('Registration');
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
                  isFaceIdAvailable
                      ? GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => const Dialog());
                          },
                          child: Stack(
                            children: [
                              ScaleTransition(
                                scale: _scaleAnimation,
                                child: SizedBox(
                                  height: 90,
                                  child:
                                      Image.asset("assets/images/FaceID.png"),
                                ),
                              ),
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
