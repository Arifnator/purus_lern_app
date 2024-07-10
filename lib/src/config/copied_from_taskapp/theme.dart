import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purus_lern_app/src/config/copied_from_taskapp/palette.dart';


ThemeData themeData(
    {required bool isDarkTheme, required BuildContext context}) {
  TextTheme baseTextTheme =
      isDarkTheme ? ThemeData.dark().textTheme : ThemeData.light().textTheme;
  TextTheme customTextTheme =
      baseTextTheme.apply(fontFamily: GoogleFonts.figtree().fontFamily);
  return ThemeData.from(
    useMaterial3: false,
    colorScheme: isDarkTheme ? darkScheme : lightScheme,
    textTheme: customTextTheme,
  );
}

ColorScheme lightScheme = ColorScheme.fromSeed(
  seedColor: barcelonaOrange,
  primary: barcelonaOrange,
  secondary: dreamlessBlack,
  brightness: Brightness.light,
  tertiary: dreamlessBlack,
);
ColorScheme darkScheme = ColorScheme.fromSeed(
  seedColor: dreamlessBlack,
  primary: barcelonaOrange,
  secondary: dreamlessBlack,
  brightness: Brightness.dark,
  tertiary: barcelonaOrange,
);
