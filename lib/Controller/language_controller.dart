import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends ChangeNotifier{
   Locale? _getLanguage;
   Locale? get getLanguage => _getLanguage;

  void changeLanguage(Locale locale)async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(locale == const Locale("en")){
      _getLanguage = locale;
      await preferences.setString("language_code", "en");
    } else if(locale == const Locale("ur")){
      _getLanguage = locale;
      await preferences.setString("language_code", "ur");
    }else {
      _getLanguage = locale;
      await preferences.setString("language_code", "hi");
    }
    notifyListeners();
  }
}