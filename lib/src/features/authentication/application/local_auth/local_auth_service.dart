import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:purus_lern_app/src/data/app_info.dart';

class LocalAuthService {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> isDeviceSupported() async {
    if (currentPlatform != "Web" && currentPlatform != "Unknown") {
      return await _auth.isDeviceSupported();
    } else {
      return false;
    }
  }

  Future<bool> isBiometricAvailable() async {
    if (currentPlatform != "Web" && currentPlatform != "Unknown") {
      try {
        return await _auth.canCheckBiometrics &&
            await _auth.isDeviceSupported();
      } catch (e) {
        debugPrint(e.toString());
        return false;
      }
    } else {
      return false;
    }
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (e) {
      debugPrint(e.toString());
      return <BiometricType>[];
    }
  }

  Future<bool> authenticateUser() async {
    try {
      bool isAuthenticated = await _auth.authenticate(
        localizedReason: 'Please authenticate to continue',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
          // useErrorDialogs: true,
        ),
      );
      return isAuthenticated;
    } catch (e) {
      debugPrint("Error during authentication: $e");
      return false;
    }
  }
}
