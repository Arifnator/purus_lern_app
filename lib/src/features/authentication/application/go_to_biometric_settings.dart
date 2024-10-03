import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'package:purus_lern_app/src/features/authentication/application/local_auth_service.dart';
import 'package:purus_lern_app/src/features/authentication/data/login_conditions.dart';
import 'package:purus_lern_app/src/widgets/my_snack_bar.dart';

Future<void> goToBiometricSettings(BuildContext context) async {
  if (Theme.of(context).platform == TargetPlatform.android) {
    await AppSettings.openAppSettings(type: AppSettingsType.lockAndPassword)
        .whenComplete(() async {
      isDeviceSupportedForBiometric =
          await LocalAuthService().isDeviceSupported();
      checkBiometricAvailability();
    });
    // AppSettings.openAppSettings(type: AppSettingsType.security);
  } else if (Theme.of(context).platform == TargetPlatform.iOS) {
    // AppSettings.openAppSettings(type: AppSettingsType.lockAndPassword);
    await AppSettings.openAppSettings(type: AppSettingsType.security);
  } else {
    mySnackbar(context,
        "Plattform ist fürs Navigieren zu den Einstellungen nicht unterstützt.");
  }
}
