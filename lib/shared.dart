import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static late final SharedPreferences _prefs;
  static const String _saveTextKey = 'text';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static saveText(String text) async {
    await _prefs.setString(_saveTextKey, text);
  }

  static Future<void> removeText() async {
    await _prefs.remove(_saveTextKey);
  }

  static String get getText => _prefs.getString(_saveTextKey) ?? '';
}
