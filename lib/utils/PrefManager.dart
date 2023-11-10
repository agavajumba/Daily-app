import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  setOnBoardingScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isActive", false);
  }

  Future<bool> getOnBoardingScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isActive") ?? true;
  }
}
