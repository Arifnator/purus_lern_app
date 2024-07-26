import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/config/gradients.dart';
import 'package:purus_lern_app/src/config/palette.dart';
import 'package:purus_lern_app/src/core/presentation/splash_screen.dart';

class GradientAnimationScreen extends StatefulWidget {
  const GradientAnimationScreen({super.key});

  @override
  State<GradientAnimationScreen> createState() =>
      _GradientAnimationScreenState();
}

class _GradientAnimationScreenState extends State<GradientAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _gradientAnimationController;
  late Animation<double> _animationValue;

  @override
  void initState() {
    super.initState();

    _gradientAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _animationValue = Tween<double>(begin: 0.0, end: 1.0)
        .animate(_gradientAnimationController);

    _gradientAnimationController.forward();

    _gradientAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SplashScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _gradientAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _gradientAnimationController,
        builder: (context, child) {
          return Container(
            decoration: MyBackgroundGradient(
            colors: [
              Color.lerp(purusGreen, Colors.white, _animationValue.value)!,
              purusGreen,
              Color.lerp(purusGreen, purusDarkGreen, _animationValue.value)!,
            ],
          ).myBackgroundGradient()
          );
        },
      ),
    );
  }
}
