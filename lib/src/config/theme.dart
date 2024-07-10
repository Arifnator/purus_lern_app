import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/config/palette.dart';

BoxDecoration backgroundGradient = BoxDecoration(
  gradient: LinearGradient(
    begin: const Alignment(0.00, -1.00),
    end: const Alignment(0, 1),
    colors: [Colors.white, purusGreen, purusDarkGreen],
  ),
);
