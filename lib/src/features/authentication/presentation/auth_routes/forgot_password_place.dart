import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/config/palette.dart';
import 'package:purus_lern_app/src/core/firebase/firebase_analytics/log_errors.dart';
import 'package:purus_lern_app/src/widgets/my_button.dart';
import 'package:purus_lern_app/src/widgets/my_textfield.dart';

class ForgotPasswordPlace extends StatefulWidget {
  const ForgotPasswordPlace({super.key, required this.transitionToRoute});

  final void Function(String route) transitionToRoute;

  @override
  State<ForgotPasswordPlace> createState() => _ForgotPasswordPlaceState();
}

class _ForgotPasswordPlaceState extends State<ForgotPasswordPlace> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController resetPasswortController = TextEditingController();

  final double _columnSpacing = 25;
  final bool _isUsernameValid = false;

  String _alertText =
      "Bitte geben Sie Ihre E-Mail Adresse ein,\num ihr Passwort zurückzusetzen.";
  Color _alertTextColor = Colors.white;

  void __alertTextUpdate() {
    if (!_isUsernameValid) {
      setState(() {
        _alertText = "Benutzername oder E-Mail nicht gefunden.";
        _alertTextColor = purusRed;
      });
      logErrors(_alertText);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(
                    height: 60,
                  ),
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
                  const SizedBox(
                    height: 60,
                  ),
                  MyTextfield(
                    controller: resetPasswortController,
                    hintText: "Benutzername oder E-Mail",

                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    // icon: const Icon(Icons.email, color: purusGreen),
                    onSubmitted: (p0) {
                      __alertTextUpdate();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                  SizedBox(
                    height: _columnSpacing,
                  ),
                  MyButton(
                    fontSize: 19,
                    onTap: () {
                      __alertTextUpdate();
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
                    text: "Passwort Zurücksetzen",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 80,
                        child: Center(
                          child: Text(
                            "Haben Sie kein Account? Hier zur ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          widget.transitionToRoute('Registration');
                        },
                        child: const SizedBox(
                          height: 80,
                          child: Center(
                            child: Text(
                              "Registration",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      color: Colors.white,
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        widget.transitionToRoute('Login');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
