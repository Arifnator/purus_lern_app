import 'package:flutter/material.dart';
import 'package:purus_lern_app/main.dart';
import 'package:purus_lern_app/src/core/main_initialize.dart';
import 'package:purus_lern_app/src/features/authentication/application/stay_logged_in.dart';

void logout(BuildContext context) {
  StayLoggedIn().logout();
  initializeApp();

  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const PurusMain()),
    (Route<dynamic> route) => false,
  );
}
