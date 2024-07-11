import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/config/palette.dart';

const BoxDecoration backgroundGradient = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment(0.00, -1.00),
    end: Alignment(0, 1),
    stops: [0.2, 0.8, 1.0],
    colors: [Colors.white, purusGreen, purusDarkGreen],
  ),
);

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