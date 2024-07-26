import 'package:flutter/material.dart';

class MenuCardClass {
  String title;
  Widget child;
  VoidCallback onTap;

  MenuCardClass(
      {required this.title, required this.onTap, required this.child});
}
