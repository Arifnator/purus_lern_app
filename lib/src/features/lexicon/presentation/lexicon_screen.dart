import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LexiconScreen extends StatelessWidget {
  const LexiconScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RiveAnimation.asset(
      "assets/animations/home_to_green.riv",
    );
  }
}
