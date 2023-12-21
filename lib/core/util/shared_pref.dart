import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<void> saveInLocal({String? key, String? value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('$key', '$value');
  }

  Future<String> getFromLocal({String? key}) async {
    String value = '';
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getString('$key')!;
    return value;
  }
}
