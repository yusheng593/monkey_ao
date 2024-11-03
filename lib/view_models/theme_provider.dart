import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monkey_ao/enums/theme_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider =
    StateNotifierProvider<ThemeProvider, ThemeEnum>((_) => ThemeProvider());

class ThemeProvider extends StateNotifier<ThemeEnum> {
  final prefsLightKey = 'isLightMode';
  ThemeProvider() : super(ThemeEnum.ligth) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isLightMode = prefs.getBool(prefsLightKey) ?? true;
    state = isLightMode ? ThemeEnum.ligth : ThemeEnum.dark;
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (state == ThemeEnum.ligth) {
      state = ThemeEnum.dark;
      await prefs.setBool(prefsLightKey, false);
    } else {
      state = ThemeEnum.ligth;
      await prefs.setBool(prefsLightKey, true);
    }
  }
}
