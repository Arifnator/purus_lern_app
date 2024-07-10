import 'dart:async';
import 'package:purus_lern_app/src/features/authentication/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/config/palette.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: purusGreen),
    ));
  }
}