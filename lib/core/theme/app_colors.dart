import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';

class AppColors {
  static ThemeController get _themeController => ThemeController.to;
  
  // Primary Colors
  static Color get primary => _themeController.isDarkMode 
    ? const Color(0xFF2979FF) // Electric blue
    : const Color(0xFF1976D2);
    
  static Color get primaryVariant => _themeController.isDarkMode 
    ? const Color(0xFF00FFF0) // Neon cyan
    : const Color(0xFF1565C0);
    
  static Color get primaryLight => _themeController.isDarkMode 
    ? const Color(0xFF82B1FF) // Lighter blue
    : const Color(0xFF42A5F5);
    
  static Color get primaryDark => _themeController.isDarkMode 
    ? const Color(0xFF004BA0) // Deep blue
    : const Color(0xFF0D47A1);
  
  // Secondary Colors
  static Color get secondary => _themeController.isDarkMode 
    ? const Color(0xFFFF2D95) // Vivid magenta
    : const Color(0xFFFF9800);
    
  static Color get secondaryVariant => _themeController.isDarkMode 
    ? const Color(0xFFB388FF) // Soft purple
    : const Color(0xFFF57C00);
    
  static Color get secondaryLight => _themeController.isDarkMode 
    ? const Color(0xFFFFB1E6) // Light magenta
    : const Color(0xFFFFB74D);
    
  static Color get secondaryDark => _themeController.isDarkMode 
    ? const Color(0xFF8C1AFF) // Deep purple
    : const Color(0xFFE65100);
  
  // Background Colors
  static Color get background => _themeController.isDarkMode 
    ? const Color(0xFF0A0F1C) // Deep navy
    : const Color(0xFFFAFAFA);
    
  static Color get surface => _themeController.isDarkMode 
    ? const Color(0xFF18213A) // Slate blue
    : const Color(0xFFFFFFFF);
    
  static Color get cardBackground => _themeController.isDarkMode 
    ? const Color(0xFF18213A) // Card color
    : const Color(0xFFFFFFFF);
    
  static Color get scaffoldBackground => _themeController.isDarkMode 
    ? const Color(0xFF0A0F1C) // Deep navy
    : const Color(0xFFFAFAFA);
  
  // Text Colors
  static Color get textPrimary => _themeController.isDarkMode 
    ? const Color(0xFFFFFFFF) // White
    : const Color(0xFF212121);
    
  static Color get textSecondary => _themeController.isDarkMode 
    ? const Color(0xFFB0BEC5) // Blue-grey
    : const Color(0xFF757575);
    
  static Color get textHint => _themeController.isDarkMode 
    ? const Color(0xFF90A4AE) // Lighter blue-grey
    : const Color(0xFFBDBDBD);
    
  static Color get textDisabled => _themeController.isDarkMode 
    ? const Color(0xFF546E7A) // Muted blue-grey
    : const Color(0xFFE0E0E0);
  
  // Icon Colors
  static Color get iconPrimary => _themeController.isDarkMode 
    ? const Color(0xFFFFFFFF) 
    : const Color(0xFF212121);
    
  static Color get iconSecondary => _themeController.isDarkMode 
    ? const Color(0xFFB0BEC5) 
    : const Color(0xFF757575);
    
  static Color get iconDisabled => _themeController.isDarkMode 
    ? const Color(0xFF546E7A) 
    : const Color(0xFFE0E0E0);
  
  // Border Colors
  static Color get border => !_themeController.isDarkMode 
    ? const Color(0xFF23395D) // Subtle blue-grey
    : const Color(0xFFE0E0E0);
    
  static Color get borderLight => _themeController.isDarkMode 
    ? const Color(0xFF1B263B) // Slightly lighter than card
    : const Color(0xFFF5F5F5);
    
  static Color get divider => _themeController.isDarkMode 
    ? const Color(0xFF23395D) // Subtle blue-grey
    : const Color(0xFFE0E0E0);
  
  // Status Colors
  static Color get success => _themeController.isDarkMode 
    ? const Color(0xFF00E676) // Bright green
    : const Color(0xFF4CAF50);
    
  static Color get error => _themeController.isDarkMode 
    ? const Color(0xFFFF5252) // Coral red
    : const Color(0xFFD32F2F);
    
  static Color get warning => _themeController.isDarkMode 
    ? const Color(0xFFFFD600) // Vivid yellow
    : const Color(0xFFFF9800);
    
  static Color get info => _themeController.isDarkMode 
    ? const Color(0xFF00FFF0) // Neon cyan
    : const Color(0xFF2196F3);
  
  // Overlay Colors
  static Color get overlay => _themeController.isDarkMode 
    ? const Color(0x80000000) 
    : const Color(0x80000000);
    
  static Color get shadow => _themeController.isDarkMode 
    ? const Color(0xFF2979FF) // Electric blue shadow
    : const Color(0x1A000000);
  
  // Input Colors
  static Color get inputBackground => _themeController.isDarkMode 
    ? const Color(0xFF1B263B) // Slightly lighter than card
    : const Color(0xFFF5F5F5);
    
  static Color get inputBorder => _themeController.isDarkMode 
    ? const Color(0xFF23395D) // Subtle blue-grey
    : const Color(0xFFE0E0E0);
    
  static Color get inputFocusedBorder => _themeController.isDarkMode 
    ? const Color(0xFF00FFF0) // Neon cyan
    : const Color(0xFF1976D2);
  
  // Button Colors
  static Color get buttonPrimary => _themeController.isDarkMode 
    ? const Color(0xFF2979FF) // Electric blue
    : const Color(0xFF1976D2);
    
  static Color get buttonSecondary => _themeController.isDarkMode 
    ? const Color(0xFFFF2D95) // Magenta
    : const Color(0xFFF5F5F5);
    
  static Color get buttonDisabled => _themeController.isDarkMode 
    ? const Color(0xFF23395D) // Subtle blue-grey
    : const Color(0xFFE0E0E0);
  
  // App Bar Colors
  static Color get appBarBackground => _themeController.isDarkMode 
    ? const Color(0xFF18213A) // Slate blue
    : const Color(0xFF1976D2);
    
  static Color get appBarForeground => _themeController.isDarkMode 
    ? const Color(0xFFFFFFFF) 
    : const Color(0xFFFFFFFF);
  
  // Gradient Colors
  static List<Color> get primaryGradient => _themeController.isDarkMode 
    ? [const Color(0xFF2979FF), const Color(0xFF00FFF0)] // Blue to neon cyan
    : [const Color(0xFF1976D2), const Color(0xFF0D47A1)];
    
  static List<Color> get secondaryGradient => _themeController.isDarkMode 
    ? [const Color(0xFFFF2D95), const Color(0xFF00FFF0)] // Magenta to neon cyan
    : [const Color(0xFFFF9800), const Color(0xFFF57C00)];
  
  // Utility method to get color based on theme
  static Color getColor({
    required Color lightColor,
    required Color darkColor,
  }) {
    return _themeController.isDarkMode ? darkColor : lightColor;
  }
  
  // Utility method to get gradient based on theme
  static List<Color> getGradient({
    required List<Color> lightGradient,
    required List<Color> darkGradient,
  }) {
    return _themeController.isDarkMode ? darkGradient : lightGradient;
  }
} 