import 'package:shared_preferences/shared_preferences.dart';

// Register Page => Button Click
void createUser(String email, String password) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("e1", email);
  sharedPreferences.setString("p1", password);
}

Future<String?> getUserEmailSHR() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString("e1");
}

Future<String?> getUserPasswordSHR() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString("p1");
}

void isLogin(bool value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setBool('loginStatus', value);
}

Future<bool?> getLoginSHR() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getBool("loginStatus");
}

void clearSHR() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.clear();
}
