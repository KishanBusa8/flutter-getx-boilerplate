import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();
  
  final _isDarkMode = true.obs;
  final _themeMode = ThemeMode.dark.obs;
  
  bool get isDarkMode => _isDarkMode.value;
  ThemeMode get themeMode => _themeMode.value;
  
  @override
  void onInit() {
    super.onInit();
    _loadThemeMode();
  }
  
  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final savedThemeMode = prefs.getString('theme_mode') ?? 'dark';
    
    if (savedThemeMode == 'dark') {
      _isDarkMode.value = true;
      _themeMode.value = ThemeMode.dark;
    } else {
      _isDarkMode.value = false;
      _themeMode.value = ThemeMode.light;
    }
  }
  
  Future<void> toggleTheme() async {
    _isDarkMode.value = !_isDarkMode.value;
    _themeMode.value = _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme_mode', _isDarkMode.value ? 'dark' : 'light');
    
    Get.changeThemeMode(_themeMode.value);
  }
  
  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode.value = mode;
    _isDarkMode.value = mode == ThemeMode.dark;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme_mode', _isDarkMode.value ? 'dark' : 'light');
    
    Get.changeThemeMode(_themeMode.value);
  }
} 