import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  ThemeMode _themeMode = ThemeMode.light;
  String _userLocation = "tehran";

  get userLocation => _userLocation;
  get themeMode => _themeMode;
  get isDarkMode => _isDarkMode;

  SettingProvider() {
    loadSettings();
  }

  void loadSettings() async {
    final box = Hive.box('settingsBox');
    _isDarkMode = box.get('darkMode', defaultValue: false);
    if (_isDarkMode) {
      _themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }

  void saveLocation(String userLoc) async {
    final box = Hive.box('settingsBox');

    await box.put('location', userLoc);
    _userLocation = userLoc;
    notifyListeners();
  }

  void toggleThemeMode() async {
    _isDarkMode = false;
    final box = Hive.box('settingsBox');
    if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;

      _isDarkMode = false;
      await box.put('darkMode', false);
    } else {
      _themeMode = ThemeMode.dark;
      _isDarkMode = true;
      await box.put('darkMode', true);
    }
    notifyListeners();
  }
}
