import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/features/authentication/application/local_auth/check_biometric_availability.dart';
import 'package:purus_lern_app/src/features/authentication/application/local_auth/local_auth_service.dart';
import 'package:purus_lern_app/src/features/authentication/data/login_conditions.dart';
import 'package:purus_lern_app/src/widgets/my_snack_bar.dart';

Future<void> refreshBiometricState(
    BuildContext context, bool isMounted, bool showSnack) async {
  isDeviceSupportedForBiometric.value =
      await LocalAuthService().isDeviceSupported();
  await checkBiometricAvailability();
  if (isMounted && showSnack) {
    // ignore: use_build_context_synchronously
    mySnackbar(context, "Verfügbarkeit biometrischer Anmeldung wurde geprüft.");
  }
}
