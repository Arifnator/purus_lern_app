import 'package:purus_lern_app/src/features/authentication/data/login_conditions.dart';
import 'package:shared_preferences/shared_preferences.dart';

void updateFaceId(bool value) async {
  isFaceIdConfigured = value;
  FaceidSharedpref sharedPrefFaceid = FaceidSharedpref();
  await sharedPrefFaceid.setFaceIdAvailability(value);
}

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


