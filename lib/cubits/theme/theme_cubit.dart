import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_music_player/core/theme/app_themes.dart';

class ThemeState {
  final String themeKey;
  final ThemeData themeData;

  ThemeState({required this.themeKey, required this.themeData});
}

class ThemeCubit extends Cubit<ThemeState> {
  static const String _prefKey = "selected_theme";

  ThemeCubit() : super(ThemeState(themeKey: 'purple', themeData: AppThemes.themes['purple']!)) {
    loadTheme();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedKey = prefs.getString(_prefKey) ?? 'purple';
    emit(ThemeState(themeKey: savedKey, themeData: AppThemes.themes[savedKey]!));
  }

  Future<void> setTheme(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, key);
    emit(ThemeState(themeKey: key, themeData: AppThemes.themes[key]!));
  }
}
