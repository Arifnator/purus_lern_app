import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/config/palette.dart';

class MyBackgroundGradient {
  MyBackgroundGradient(
      {this.colors = const [Colors.white, purusGreen, purusDarkGreen]})
      : assert(
          colors.length == 3,
        );

  final List<Color> colors;

  BoxDecoration myBackgroundGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: const Alignment(0.00, -1.00),
        end: const Alignment(0, 1),
        stops: const [0.2, 0.8, 1.0],
        colors: colors,
      ),
    );
  }
}

const LinearGradient bottomBarGradient = LinearGradient(
  begin: Alignment(0.00, -1.00),
  end: Alignment(0, 1),
  colors: [
    purusGreen,
    Color.fromARGB(255, 16, 100, 68),
    Color.fromARGB(255, 0, 42, 30),
  ],
);


// Color(0xFF338771),
// Color.fromARGB(255, 16, 100, 77),
// Color.fromARGB(255, 0, 42, 30),