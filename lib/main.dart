// import 'src/core/splash_screen.dart'; -- SplashScreen()
// import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:purus_lern_app/ablage/tween_home.dart';
// import 'package:window_manager/window_manager.dart';
// import 'package:flutter/services.dart';
import 'package:purus_lern_app/src/config/main_config.dart';
import 'package:purus_lern_app/src/config/rive_manager.dart';
import 'package:purus_lern_app/src/features/authentication/presentation/splash_gradient_animation.dart';
// import 'package:rive_splash_screen/rive_splash_screen.dart';
// import 'package:purus_lern_app/src/core/presentation/onboarding.dart';
// import 'package:purus_lern_app/src/features/authentication/presentation/login_faceid_screen.dart';
// import 'package:purus_lern_app/src/features/authentication/presentation/login_screen.dart';

// feature first: https://mobterest.medium.com/mastering-feature-first-architecture-building-scalable-flutter-mobile-apps-5c706b6e42be


// THEMEEEES

// bottombar gradient animation

// copy with her yerde oluyor mu?

// 1. First open + onboarding
// 2. Autologin FaceID
// 3. Angemeldet bleiben
// flutter pub add sf_symbols // flutter pub add flutter_sficon  // flutter pub add drop_shadow_image

// BackdropFilter(
//                         filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
//                         child:

// flutter pub add scaled_app -- runAppScaled

//   smooth_corner: ^1.0.0

// blur effekte

// BOXCONTRAINS
// rive ohne laden?

// check internet connection? / offline learn??? -- https://www.youtube.com/watch?v=0si2HPnRCuE

// Icons skalierbar!
// icon & altina shadow effekt
// ontap effekt
// minimun size
// main icon dunkelmodus
// tüm snackbbar fln ios androit yap
// alles skaliebar?
// darkmode with splashsreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // // SplashScreen purusGreen:
  // await Future.delayed(const Duration(milliseconds: 500));
  // FlutterNativeSplash.remove();

  // Initialize Rive and load animations
  await RiveManager().initialize();

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