import 'dart:async';
import 'package:purus_lern_app/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:purus_lern_app/styles/my_colors.dart';

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
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
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






// Text(
//     '9:41',
//     textAlign: TextAlign.center,
//     style: TextStyle(
//         color: Colors.white,
//         fontSize: 17,
//         fontFamily: 'SF Pro',
//         fontWeight: FontWeight.w590,
//         height: 0.08,
//     ),
// )


