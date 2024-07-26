// Navi soll nicht push, opacity

import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/config/gradients.dart';
import 'package:rive/rive.dart';
import 'package:purus_lern_app/src/core/presentation/home_screen.dart';
import 'package:purus_lern_app/src/core/presentation/onboarding.dart';
import 'package:purus_lern_app/src/features/authentication/presentation/login_faceid_screen.dart';
import 'package:purus_lern_app/src/features/authentication/presentation/login_screen.dart';

Map<String, Widget> authenticationRoutes = {
  'Onboarding': const Onboarding(),
  'Login': const LoginScreen(),
  'FaceId': const LoginFaceidScreen(),
  'Home': const HomeScreen(),
};

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _routeAnimationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _splashEndRoute();
    _routeAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_routeAnimationController);
  }

  void _splashEndRoute() async {
    await Future.delayed(const Duration(seconds: 5));

    if (mounted) {
      _routeAnimationController.forward();
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: authenticationRoutes[checkCondition()]!,
            );
          },
          transitionDuration: const Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  void dispose() {
    _routeAnimationController.dispose();
    super.dispose();
  }

  String checkCondition() {
    bool isLoggedIn = true;
    bool isOnboardingComplete = true;
    bool isFaceIdAvailable = false;

    if (isLoggedIn) {
      return 'Home';
      // ignore: dead_code
    } else if (isOnboardingComplete) {
      return 'Login';
    } else if (isFaceIdAvailable) {
      return 'FaceId';
    } else {
      return 'Onboarding';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: MyBackgroundGradient().myBackgroundGradient(),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              SizedBox(
                height: 350,
                width: 350,
                child: RiveAnimation.asset(
                  'assets/animations/splash_animation.riv',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
