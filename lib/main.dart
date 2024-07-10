// import 'src/core/splash_screen.dart'; -- SplashScreen()
import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/core/home_screen.dart';

// feature first: https://mobterest.medium.com/mastering-feature-first-architecture-building-scalable-flutter-mobile-apps-5c706b6e42be

// 1. First open
// 2. Autologin FaceID
// 3. Angemeldet bleiben

void main() {
  runApp(const PurusMain());
}

class PurusMain extends StatelessWidget {
  const PurusMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
