// import 'src/core/splash_screen.dart'; -- SplashScreen()
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purus_lern_app/src/config/main_config.dart';
import 'package:purus_lern_app/src/core/home_screen.dart';
import 'package:purus_lern_app/src/core/splash_screen.dart';
import 'package:purus_lern_app/src/features/authentication/presentation/login_faceid_screen.dart';
import 'package:purus_lern_app/src/features/authentication/presentation/login_screen.dart';

// feature first: https://mobterest.medium.com/mastering-feature-first-architecture-building-scalable-flutter-mobile-apps-5c706b6e42be

// 1. First open
// 2. Autologin FaceID
// 3. Angemeldet bleiben

// BOXCONTRAINS

// Icons skalierbar!
// icon & altina shadow effekt
// ontap effekt

Map<String, Widget> authenticationRoutes = {
  "Login": const LoginScreen(),
  "FaceId": const LoginFaceidScreen(),
  'Home': const HomeScreen(),
};

void main() {
  const SplashScreen();
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