import 'package:flutter/material.dart';
import 'package:petstore/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _selectedTheme = lightMode;
  ThemeData get getTheme => _selectedTheme;

  Future<void> toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_selectedTheme == lightMode) {
      _selectedTheme = darkMode;
      await prefs.setString('selectedTheme', 'darkMode');
    } else {
      _selectedTheme = lightMode;
      await prefs.setString('selectedTheme', 'lightMode');
    }
    notifyListeners();
  }

  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeString = prefs.getString('selectedTheme');

    _selectedTheme = themeString == 'lightMode' ? lightMode : darkMode;
    notifyListeners();
  }
}
