import 'package:shared_preferences/shared_preferences.dart';

class FaceidSharedpref {
  Future<void> setFaceIdAvailability(bool isFaceIdAvailable) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFaceIdAvailable', isFaceIdAvailable);
  }

  Future<bool> getFaceIdAvailability() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFaceIdAvailable') ?? false;
  }
}


