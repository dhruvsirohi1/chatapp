import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  static String SharedUserNameKey = "USERNAME";
  static String SharedTokenKey = "USERTOKEN";
  static String LogInStateKey = "LOGGEDINKEY";

  static Future<void> saveUserName(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(SharedUserNameKey, username);
  }

  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(SharedTokenKey, token);
  }

  static Future<void> saveLogInState(bool loggedin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(LogInStateKey, loggedin);
  }

  static Future<String> getSharedUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(SharedUserNameKey);
  }

  static Future<String> getSharedToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(SharedTokenKey);
  }

  static Future<String> getSharedUserState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(LogInStateKey);
  }
}
