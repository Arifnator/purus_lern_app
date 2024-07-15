// import 'src/core/splash_screen.dart'; -- SplashScreen()
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:window_manager/window_manager.dart';
// import 'package:flutter/services.dart';
import 'package:purus_lern_app/src/config/main_config.dart';
import 'package:purus_lern_app/src/core/presentation/home_screen.dart';
import 'package:purus_lern_app/src/config/rive_manager.dart';
import 'package:purus_lern_app/src/features/authentication/presentation/login_faceid_screen.dart';
import 'package:purus_lern_app/src/features/authentication/presentation/login_screen.dart';

// feature first: https://mobterest.medium.com/mastering-feature-first-architecture-building-scalable-flutter-mobile-apps-5c706b6e42be

// 1. First open + onboarding
// 2. Autologin FaceID
// 3. Angemeldet bleiben

// BackdropFilter(
//                         filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
//                         child:

// flutter pub add scaled_app -- runAppScaled

//   smooth_corner: ^1.0.0

// BOXCONTRAINS
// rive ohne laden?

// check internet connection? / offline learn??? -- https://www.youtube.com/watch?v=0si2HPnRCuE

// Icons skalierbar!
// icon & altina shadow effekt
// ontap effekt
// minimun size
// main icon dunkelmodus
// alles skaliebar?
// darkmode with splashsreen

Map<String, Widget> authenticationRoutes = {
  "Login": const LoginScreen(),
  "FaceId": const LoginFaceidScreen(),
  'Home': const HomeScreen(),
};

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // SplashScreen purusGreen:
  await Future.delayed(const Duration(milliseconds: 500));
  FlutterNativeSplash.remove();

  // Initialize Rive and load animations
  await RiveManager().initialize();

  runApp(const PurusMain());
}

class PurusMain extends StatelessWidget {
  const PurusMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      home: authenticationRoutes["Home"],
      debugShowCheckedModeBanner: false,
    );
  }
}


// AnnotatedRegion<SystemUiOverlayStyle>(
//             //Set status bar icon color
//             value: your_condition
//                 ? SystemUiOverlayStyle.dark.copyWith(
//                     statusBarColor: your_color,
//                     //statusBarIconBrightness: Brightness.light,
//                   )
//                 : SystemUiOverlayStyle.light.copyWith(
//                     statusBarColor: your_color,
//                     //statusBarIconBrightness: Brightness.light,
//                   ),
//             child:
// ),


//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);






  // async
  // WidgetsFlutterBinding.ensureInitialized();
  // await windowManager.ensureInitialized();

  // WidgetsFlutterBinding.ensureInitialized();
  // await windowManager.ensureInitialized();
  // if (Platform.isMacOS) {
  //   WindowManager.instance.setMinimumSize(const Size(20, 20));
  // }