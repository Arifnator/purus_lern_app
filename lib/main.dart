import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/config/main_config.dart';
import 'package:purus_lern_app/src/core/main_initialize.dart';
import 'package:purus_lern_app/src/features/authentication/presentation/splash_gradient_animation.dart';

void main() async {
  await initializeApp();

  runApp(const PurusMain());
}

class PurusMain extends StatelessWidget {
  const PurusMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appName,
      home: SplashGradientAnimation(),
      debugShowCheckedModeBanner: false,
    );
  }
}
