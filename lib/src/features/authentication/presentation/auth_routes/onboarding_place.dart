import 'package:flutter/material.dart';

class OnboardingPlace extends StatelessWidget {
  const OnboardingPlace({super.key, required this.transitionToRoute});

  final void Function(String route) transitionToRoute;


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
