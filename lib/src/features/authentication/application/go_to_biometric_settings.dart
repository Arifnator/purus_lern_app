import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'package:purus_lern_app/src/widgets/my_snack_bar.dart';

void goToBiometricSettings(BuildContext context) {
  if (Theme.of(context).platform == TargetPlatform.android) {
    AppSettings.openAppSettings(type: AppSettingsType.security);
  } else if (Theme.of(context).platform == TargetPlatform.iOS) {
    AppSettings.openAppSettings(type: AppSettingsType.settings);
  } else {
    mySnackbar(context,
        "Leider kann auf dieser Plattform nicht zu den Einstellungen navigiert werden.");
  }
}
