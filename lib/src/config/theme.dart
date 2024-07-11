import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/config/palette.dart';

BoxDecoration backgroundGradient = BoxDecoration(
  gradient: LinearGradient(
    begin: const Alignment(0.00, -1.00),
    end: const Alignment(0, 1),
    colors: [Colors.white, purusGreen, purusDarkGreen],
  ),
);

const LinearGradient bottomBarGradient = LinearGradient(
  begin: Alignment(0.00, -1.00),
  end: Alignment(0, 1),
  colors: [Color(0xFF338771), Color(0xFF137257), Color(0xFF003826)],
);
