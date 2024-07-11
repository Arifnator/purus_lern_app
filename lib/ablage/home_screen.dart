// Abgelegt wegen rive animation. Vorher wurde tween animation verwendet.










import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:purus_lern_app/src/config/theme.dart';
import 'package:purus_lern_app/src/core/mainmenu_screen.dart';
import 'package:purus_lern_app/src/features/education_portal/education_screen.dart';
import 'package:purus_lern_app/src/features/lexicon/presentation/lexicon_screen.dart';
import 'package:purus_lern_app/src/features/settings/presentation/settings_screen.dart';

const Map<String, Widget> mainScreens = {
  "Hauptmenü": MainmenuScreen(),
  "Lernmenü": EducationScreen(),
  "Lexikon": LexiconScreen(),
  "Einstellungen": SettingsScreen(),
};
int _currentIndex = 2;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: backgroundGradient,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Column(children: [
            Expanded(child: mainScreens.values.toList()[_currentIndex]),
            const Align(
                alignment: Alignment.bottomCenter, child: MyNavigationBar()),
          ]),
        ));
  }
}

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({
    super.key,
  });

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  List<double> _heights = [
    28,
    20,
    20,
    20,
  ];

  List<Color> _colors = [
    Colors.white,
    Colors.black,
    Colors.black,
    Colors.black,
  ];

  double sizedBoxBetween = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 94,
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 21),
      decoration: const ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xFF338771), Color(0xFF137257), Color(0xFF003826)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x23000000),
            blurRadius: 30,
            offset: Offset(0, -1),
            spreadRadius: 5,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 45,
            height: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _heights[0] = 28;
                      _heights[1] = 20;
                      _heights[2] = 20;
                      _heights[3] = 20;

                      _colors[0] = Colors.white;
                      _colors[1] = Colors.black;
                      _colors[2] = Colors.black;
                      _colors[3] = Colors.black;

                      _currentIndex = 0;
                    });
                  },
                  child: AnimatedSize(
                    curve: Curves.easeIn,
                    duration: const Duration(seconds: 1),
                    child: SvgPicture.asset(
                      "assets/icons/home.svg",
                      color: _colors[0],
                      height: _heights[0],
                      width: _heights[0],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 45,
            height: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _heights[0] = 20;
                      _heights[1] = 28;
                      _heights[2] = 20;
                      _heights[3] = 20;

                      _colors[0] = Colors.black;
                      _colors[1] = Colors.white;
                      _colors[2] = Colors.black;
                      _colors[3] = Colors.black;

                      _currentIndex = 1;
                    });
                  },
                  child: AnimatedSize(
                    curve: Curves.easeIn,
                    duration: const Duration(seconds: 1),
                    child: SvgPicture.asset(
                      "assets/icons/edu.svg",
                      color: _colors[1],
                      width: _heights[1],
                      height: _heights[1],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 45,
            height: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _heights[0] = 20;
                      _heights[1] = 20;
                      _heights[2] = 28;
                      _heights[3] = 20;

                      _colors[0] = Colors.black;
                      _colors[1] = Colors.black;
                      _colors[2] = Colors.white;
                      _colors[3] = Colors.black;

                      _currentIndex = 1;
                    });
                  },
                  child: AnimatedSize(
                    curve: Curves.easeIn,
                    duration: const Duration(seconds: 1),
                    child: SvgPicture.asset(
                      "assets/icons/lexikon_buch.svg",
                      color: _colors[2],
                      height: _heights[2],
                      width: _heights[2],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const MyTweenAnimationBuilder(),
          SizedBox(
            width: 45,
            height: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _heights[0] = 20;
                      _heights[1] = 20;
                      _heights[2] = 20;
                      _heights[3] = 28;

                      _colors[0] = Colors.black;
                      _colors[1] = Colors.black;
                      _colors[2] = Colors.black;
                      _colors[3] = Colors.white;

                      _currentIndex = 1;
                    });
                  },
                  child: AnimatedSize(
                    curve: Curves.easeIn,
                    duration: const Duration(seconds: 1),
                    child: SvgPicture.asset(
                      "assets/icons/settings.svg",
                      color: _colors[3],
                      height: _heights[3],
                      width: _heights[3],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Shadow

// decoration: const BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Color(0x4C000000),
//                         blurRadius: 2,
//                         offset: Offset(4, 4),
//                         spreadRadius: 0,
//                       )
//                     ],
//                   ),

class MyTweenAnimationBuilder extends StatefulWidget {
  const MyTweenAnimationBuilder({super.key});

  @override
  State<MyTweenAnimationBuilder> createState() =>
      _MyTweenAnimationBuilderState();
}

class _MyTweenAnimationBuilderState extends State<MyTweenAnimationBuilder> {
  double targetValue = 24.0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 40, end: targetValue),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double size, Widget? child) {
        return IconButton(
          iconSize: size,
          color: Colors.black,
          icon: const Icon(Icons.aspect_ratio),
          onPressed: () {
            setState(() {
              targetValue = targetValue == 24.0 ? 48.0 : 24.0;
            });
          },
        );
      },
    );
  }
}
