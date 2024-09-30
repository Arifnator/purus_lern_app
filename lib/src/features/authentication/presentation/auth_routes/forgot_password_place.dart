import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/config/palette.dart';
import 'package:purus_lern_app/src/core/firebase/firebase_analytics/log_errors.dart';
import 'package:purus_lern_app/src/core/firebase/firebase_analytics/log_login.dart';
import 'package:purus_lern_app/src/widgets/my_button.dart';
import 'package:purus_lern_app/src/widgets/my_textfield.dart';

class ForgotPasswordPlace extends StatefulWidget {
  const ForgotPasswordPlace({super.key, required this.transitionToRoute});

  final void Function(String route) transitionToRoute;

  @override
  State<ForgotPasswordPlace> createState() => _ForgotPasswordPlaceState();
}

class _ForgotPasswordPlaceState extends State<ForgotPasswordPlace> {
  final FocusNode _usernameNode = FocusNode();

  // final _formKey = GlobalKey<FormState>();
  final TextEditingController _resetPasswortController =
      TextEditingController();

  final double _columnSpacing = 25;
  bool _isUsernameValid = false;

  String _alertText =
      "Benutzername oder E-Mail Adresse eingeben, um ihr Passwort zurückzusetzen.";
  Color _alertTextColor = Colors.white;
  Color _myTextfieldResetPasswordStrokeColor = purusGrey;

  void _validation() {
    // setState(() {
    _resetPasswortController.text.trimLeft().trimRight();
    // });

    if (_resetPasswortController.text == "admin") {
      _isUsernameValid = true;
    }

    _alertTextAndTextfieldStrokeUpdate();
    FocusManager.instance.primaryFocus?.unfocus();

    if (_isUsernameValid) {
      logLogin(
          _resetPasswortController.text.contains("@") ? "email" : "username");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                "Passwort erfolgreich Zurückgesetzt. Kontrollieren Sie Ihre E-Mail's.")),
      );
      widget.transitionToRoute('Login');
    }
    // if (_formKey.currentState!.validate()) {
    // } else {
    // }
  }

  void _alertTextAndTextfieldStrokeUpdate() {
    if (_resetPasswortController.text.isEmpty) {
      setState(() {
        _alertText = "Fehlende Eingaben";
        _alertTextColor = purusRed;
        _myTextfieldResetPasswordStrokeColor = purusRed;
      });
      logErrors(_alertText);
    } else {
      if (!_isUsernameValid) {
        setState(() {
          _alertText = "Benutzername oder E-Mail nicht gefunden.";
          _alertTextColor = purusRed;
          _myTextfieldResetPasswordStrokeColor = purusRed;
        });
        logErrors(_alertText);
      } else {
        setState(() {
          _alertText = "Passwort erfolgreich Zurückgesetzt.";
          _alertTextColor = Colors.white;
          _myTextfieldResetPasswordStrokeColor = purusGrey;
        });
      }
    }
  }

  @override
  void dispose() {
    _usernameNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SizedBox(
        width: 340,
        // child:
        // Form(
        //   key: _formKey,
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
                  height: 100,
                ),
                MyTextfield(
                  controller: _resetPasswortController,
                  hintText: "Benutzername oder E-Mail",
                  focusNode: _usernameNode,
                  strokeColor: _myTextfieldResetPasswordStrokeColor,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  // icon: const Icon(Icons.email, color: purusGreen),
                  onSubmitted: (p0) {
                    _validation();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
                SizedBox(
                  height: _columnSpacing,
                ),
                MyButton(
                  fontSize: 19,
                  onTap: () {
                    _validation();
                    FocusManager.instance.primaryFocus?.unfocus();
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
                  height: 20,
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
      // ),
    );
  }
}
