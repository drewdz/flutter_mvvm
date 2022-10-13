import 'package:mvvm_course/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String preferencesLanguage = "PREFS_KEY_LANG";

class AppPreferences {

  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(preferencesLanguage);

    if ((language == null) || language.isEmpty) {
      return LanguageType.english.getValue();
    }
    else {
      return language;
    }
  }
}