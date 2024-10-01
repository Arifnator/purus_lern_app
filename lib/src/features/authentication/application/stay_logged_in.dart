import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class StayLoggedIn {
  Future<void> setLoginStatus(bool stayLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();

    if (stayLoggedIn) {
      await prefs.setBool('isLoggedIn', true);

      String loginDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      await prefs.setString('loginDate', loginDate);
    } else {
      await prefs.setBool('isLoggedIn', false);
      await prefs.remove('loginDate');
    }
  }

  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');
    String? loginDate = prefs.getString('loginDate');

    if (isLoggedIn == null || !isLoggedIn || loginDate == null) {
      return false;
    }

    DateTime savedDate = DateFormat('yyyy-MM-dd').parse(loginDate);
    DateTime currentDate = DateTime.now();

    if (currentDate.difference(savedDate).inDays > 3) {
      await logout();
      return false;
    }

    return true;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('loginDate');
  }
}
