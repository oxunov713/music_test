import 'package:flutter/material.dart';
import 'package:music_test/src/common/theme/theme_data.dart';

class ThemeProvider extends ChangeNotifier {
  final _dark = MyAppThemeData().darkMode;
  final _light = MyAppThemeData().lightMode;
  bool darkMode = true;
  ThemeData themeData = MyAppThemeData().darkMode;

  changeTheme() {
    if (themeData == _light) {
      themeData = _dark;
      darkMode = true;
    } else {
      themeData = _light;
      darkMode = false;
    }
    notifyListeners();
  }
}
