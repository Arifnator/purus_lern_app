import "package:flutter/foundation.dart" show kIsWeb;
import "dart:io" show Platform;

String getPlatformAsString() {
  String platform;

  if (kIsWeb) {
    platform = "Web";
  } else {
    if (Platform.isAndroid) {
      platform = "Android";
    } else if (Platform.isIOS) {
      platform = "IOS";
    } else if (Platform.isMacOS) {
      platform = "MacOS";
    } else if (Platform.isWindows) {
      platform = "Windows";
      // } else if (Platform.isFuchsia) {
      //   platform = "Fuchsia";
      // } else if (Platform.isLinux) {
      //   platform = "Linux";
    } else {
      platform = "Unknown";
    }
  }

  return platform;
}
