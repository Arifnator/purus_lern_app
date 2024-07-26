import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/config/palette.dart';
import 'package:purus_lern_app/src/widgets/my_button.dart';

// fehlermeldung rot fln...
// iki parca acilsin???

class LoginPlace extends StatelessWidget {
  const LoginPlace({super.key, required this.transitionToRoute});
  final void Function(String route) transitionToRoute;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyButton(
            text: "Anmelden",
          ),
          MyButton(
            text: "Registrieren",
            bgColor: Colors.white,
            textColor: purusGreen,
            strokeColor: borderStrokeGrey,
          ),
        ],
      ),
    );
  }
}
