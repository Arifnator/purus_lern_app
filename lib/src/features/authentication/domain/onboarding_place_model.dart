import 'package:flutter/material.dart';

class OnboardingPlaceModel {
  final String title;
  final String description;
  final Widget content;
  final Color bgColor;
  final Color textColor;

  OnboardingPlaceModel(
      {required this.title,
      required this.description,
      required this.content,
      this.bgColor = Colors.blue,
      this.textColor = Colors.white});
}
