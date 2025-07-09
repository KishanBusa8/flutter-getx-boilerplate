import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  static LanguageController get to => Get.find();
  
  final _currentLocale = const Locale('en', 'US').obs;
  final _supportedLocales = <Locale>[
    const Locale('en', 'US'),
    const Locale('es', 'ES'),
    const Locale('fr', 'FR'),
    const Locale('de', 'DE'),
    const Locale('hi', 'IN'),
    const Locale('ar', 'SA'),
  ].obs;
  
  Locale get currentLocale => _currentLocale.value;
  List<Locale> get supportedLocales => _supportedLocales;
  
  @override
  void onInit() {
    super.onInit();
    _loadLanguage();
  }
  
  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguageCode = prefs.getString('language_code') ?? 'en';
    final savedCountryCode = prefs.getString('country_code') ?? 'US';
    
    _currentLocale.value = Locale(savedLanguageCode, savedCountryCode);
    Get.updateLocale(_currentLocale.value);
  }
  
  Future<void> changeLanguage(String languageCode, String countryCode) async {
    final newLocale = Locale(languageCode, countryCode);
    
    if (_supportedLocales.contains(newLocale)) {
      _currentLocale.value = newLocale;
      
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language_code', languageCode);
      await prefs.setString('country_code', countryCode);
      
      Get.updateLocale(_currentLocale.value);
    }
  }
  
  Future<void> changeLanguageByLocale(Locale locale) async {
    if (_supportedLocales.contains(locale)) {
      _currentLocale.value = locale;
      
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language_code', locale.languageCode);
      await prefs.setString('country_code', locale.countryCode ?? '');
      
      Get.updateLocale(_currentLocale.value);
    }
  }
  
  String getCurrentLanguageName() {
    switch (_currentLocale.value.languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      case 'fr':
        return 'Français';
      case 'de':
        return 'Deutsch';
      case 'hi':
        return 'हिंदी';
      case 'ar':
        return 'العربية';
      default:
        return 'English';
    }
  }
  
  bool isRTL() {
    return _currentLocale.value.languageCode == 'ar';
  }
  
  Future<void> toggleLanguage() async {
    final currentIndex = _supportedLocales.indexOf(_currentLocale.value);
    final nextIndex = (currentIndex + 1) % _supportedLocales.length;
    final nextLocale = _supportedLocales[nextIndex];
    
    await changeLanguageByLocale(nextLocale);
  }
  
  Locale get currentLanguage => _currentLocale.value;
} 