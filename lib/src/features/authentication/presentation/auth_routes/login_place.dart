import 'package:flutter/material.dart';
import 'package:flutter_sficon/flutter_sficon.dart';
import 'package:purus_lern_app/src/config/palette.dart';
import 'package:purus_lern_app/src/widgets/my_button.dart';
import 'package:purus_lern_app/src/widgets/my_textfield.dart';

// fehlermeldung rot fln...
// iki parca acilsin???
// https://docs.flutter.dev/cookbook/forms/validation
// scrollbar und flex
// alle fehler
// gesture detecotr keyborad + anmelden cakisiyor
// unfocus on button2

class LoginPlace extends StatefulWidget {
  const LoginPlace({super.key, required this.transitionToRoute});
  final void Function(String route) transitionToRoute;

  @override
  State<LoginPlace> createState() => _LoginPlaceState();
}

class _LoginPlaceState extends State<LoginPlace>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode nodeTwo = FocusNode();
  bool obscureText = true;
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

  @override
  Widget build(BuildContext context) {
    FocusNode nodeOne = FocusNode();

    return SizedBox.expand(
      child: SizedBox(
        width: 340,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                    // anmelden triggern
                  },
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter some text';
                  //   }
                  //   return null;
                  // },
                ),
                MyButton(
                  onTap: () {
                    // if (_formKey.currentState!.validate()) {
                    //   FocusManager.instance.primaryFocus?.unfocus();
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
                    //   FocusManager.instance.primaryFocus?.unfocus();
                    //   // ScaffoldMessenger.of(context).showSnackBar(
                    //   //   const SnackBar(content: Text('Please fill input')),
                    //   // );
                    // }
                  },
                  text: "Anmelden",
                ),
                MyButton(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  text: "Registrieren",
                  bgColor: Colors.white,
                  textColor: purusGreen,
                  strokeColor: borderStrokeGrey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
