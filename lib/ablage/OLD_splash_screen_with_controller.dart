// // SplashScreen.navigate(
// //     name:  'assets/splash_animation.riv',

// //     //  onSuccess: (context) {
// //     //       Navigator.of(context).pushReplacement(
// //     //         MaterialPageRoute(
// //     //           builder: (context) => const HomeScreen(),
// //     //         ),
// //     //       );
// //     //     },
// //     next: (_) => const HomeScreen(),
// //     until: () => Future.delayed(const Duration(seconds: 5)),
// //     startAnimation: '1',
// //     // onError: (context, error) {
// //     //       print('Error loading Rive animation: $error');
// //     //     },
// // ),

// // SplashScreen.callback(
// //         name: 'assets/splash_animation.riv',
// //         onSuccess: (data) {
// //           //data is the optional data returned by until callback function
// //           Navigator.of(context).pushReplacement(
// //               PageRouteBuilder(pageBuilder: (_, __, ___) => HomeScreen()));
// //         },
// //         onError: (err, stack) {
// //           //error throw by until callback function
// //         },
// //         loopAnimation: '1',
// //         until: () => Future.delayed(Duration(seconds: 1)),
// //         endAnimation: '1',
// //       ),
// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';
// import 'package:purus_lern_app/ablage/OLD_tween_home.dart';
// import 'package:purus_lern_app/src/config/theme.dart';
// import 'package:purus_lern_app/src/core/presentation/onboarding.dart';
// import 'package:purus_lern_app/src/features/authentication/presentation/login_faceid_screen.dart';
// import 'package:purus_lern_app/src/features/authentication/presentation/login_screen.dart';

// Map<String, Widget> authenticationRoutes = {
//   'Onboarding': const Onboarding(),
//   'Login': const LoginScreen(),
//   'FaceId': const LoginFaceidScreen(),
//   'Home': const HomeScreen(),
// };

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   late RiveAnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = OneShotAnimation(
//       'animation', // Ensure 'splash' is the correct animation name in your Rive file
//       onStop: _onAnimationCompleted,
//     );
//   }

//   void _onAnimationCompleted() async {
//     // Keep the logo visible for a bit longer after the animation ends
//     await Future.delayed(const Duration(seconds: 10));
//     // Now check the condition and navigate accordingly
//     String route = await checkCondition();
//     if (mounted) {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => authenticationRoutes[route]!),
//       );
//     }
//   }

//   Future<String> checkCondition() async {
//     // Simulate async condition checking
//     await Future.delayed(const Duration(seconds: 2));
    
//     // Replace with actual conditions
//     bool isLoggedIn = false; 
//     bool isOnboardingComplete = false; 

//     if (isLoggedIn) {
//       return 'Home';
//     } else if (isOnboardingComplete) {
//       return 'Login';
//     } else {
//       return 'Onboarding';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: backgroundGradient,
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Center(
//           child: Column(
//             children: [
//               const SizedBox(height: 50),
//               SizedBox(
//                 height: 350,
//                 width: 350,
//                 child: RiveAnimation.asset(
//                   'assets/animations/splash_animation.riv',
//                   controllers: [_controller], // Add controller here
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
