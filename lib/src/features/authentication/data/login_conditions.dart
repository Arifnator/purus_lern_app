// Route bedingt
import 'package:flutter/material.dart';

bool isLoggedIn = false;
bool isOnboardingNotComplete = true;
bool isFaceIdConfigured = false;


bool faceIdAskedBeforeAndNo = false;

// UI bedingt
ValueNotifier<bool> isBiometricAvailable = ValueNotifier<bool>(false);
ValueNotifier<bool> isDeviceSupportedForBiometric = ValueNotifier<bool>(false);

