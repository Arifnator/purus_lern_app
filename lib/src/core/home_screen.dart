import 'package:flutter/material.dart';
import 'package:purus_lern_app/rivetest/my_animated_bottom_bar.dart';

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


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundGradient,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: mainScreens.values.toList()[_currentIndex],
        bottomNavigationBar: MyAnimatedBottomAppBar(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ),
      ),
    );
  }
}
