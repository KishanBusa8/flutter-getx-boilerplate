import 'package:get/get.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String about = '/about';
  
  // Auth routes
  static const String signIn = '/signin';
  static const String signUp = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String verifyEmail = '/verify-email';
  
  // Feature routes
  static const String dashboard = '/dashboard';
  static const String notifications = '/notifications';
  static const String messages = '/messages';
  static const String search = '/search';
  static const String favorites = '/favorites';
  static const String history = '/history';
  
  // Detail routes
  static const String itemDetail = '/item-detail';
  static const String userDetail = '/user-detail';
  static const String categoryDetail = '/category-detail';
  
  // Settings routes
  static const String accountSettings = '/account-settings';
  static const String privacySettings = '/privacy-settings';
  static const String notificationSettings = '/notification-settings';
  static const String languageSettings = '/language-settings';
  static const String themeSettings = '/theme-settings';
  
  // Error routes
  static const String error404 = '/error-404';
  static const String error500 = '/error-500';
  static const String maintenance = '/maintenance';
  

  
  // Route configuration - Add pages as you create them
  static List<GetPage> getPages = [
    // GetPage(
    //   name: splash,
    //   page: () => const SplashPage(),
    //   transition: Transition.fadeIn,
    // ),
    // GetPage(
    //   name: signIn,
    //   page: () => const SignInPage(),
    //   transition: Transition.rightToLeft,
    // ),
    // GetPage(
    //   name: signUp,
    //   page: () => const SignUpPage(),
    //   transition: Transition.leftToRight,
    // ),
    // GetPage(
    //   name: forgotPassword,
    //   page: () => const ForgotPasswordPage(),
    //   transition: Transition.downToUp,
    // ),
    // Add your home page route here
  ];
  
  // Route guards
  static bool isAuthenticated() {
    // Implement your authentication check here
    // Example: return GetStorage().hasData('auth_token');
    return false;
  }
  
  static bool isOnboarded() {
    // Implement your onboarding check here
    // Example: return GetStorage().read('is_onboarded') ?? false;
    return false;
  }
  
  // Navigation methods
  static void goToSplash() => Get.offAllNamed(splash);
  static void goToLogin() => Get.offAllNamed(login);
  static void goToRegister() => Get.toNamed(register);
  static void goToHome() => Get.offAllNamed(home);
  static void goToProfile() => Get.toNamed(profile);
  static void goToSettings() => Get.toNamed(settings);
  static void goToAbout() => Get.toNamed(about);
  
  // Auth navigation
  static void goToForgotPassword() => Get.toNamed(forgotPassword);
  static void goToResetPassword() => Get.toNamed(resetPassword);
  static void goToVerifyEmail() => Get.toNamed(verifyEmail);
  
  // Feature navigation
  static void goToDashboard() => Get.toNamed(dashboard);
  static void goToNotifications() => Get.toNamed(notifications);
  static void goToMessages() => Get.toNamed(messages);
  static void goToSearch() => Get.toNamed(search);
  static void goToFavorites() => Get.toNamed(favorites);
  static void goToHistory() => Get.toNamed(history);
  
  // Detail navigation
  static void goToItemDetail(String id) => Get.toNamed('$itemDetail?id=$id');
  static void goToUserDetail(String id) => Get.toNamed('$userDetail?id=$id');
  static void goToCategoryDetail(String id) => Get.toNamed('$categoryDetail?id=$id');
  
  // Settings navigation
  static void goToAccountSettings() => Get.toNamed(accountSettings);
  static void goToPrivacySettings() => Get.toNamed(privacySettings);
  static void goToNotificationSettings() => Get.toNamed(notificationSettings);
  static void goToLanguageSettings() => Get.toNamed(languageSettings);
  static void goToThemeSettings() => Get.toNamed(themeSettings);
  
  // Error navigation
  static void goToError404() => Get.offAllNamed(error404);
  static void goToError500() => Get.offAllNamed(error500);
  static void goToMaintenance() => Get.offAllNamed(maintenance);
  
  // Back navigation
  static void goBack() => Get.back();
  static void goBackTo(String route) => Get.until((route) => route.settings.name == route);
  
  // Clear navigation stack
  static void clearStack() => Get.deleteAll();
  
  // Replace current route
  static void replace(String route) => Get.offNamed(route);
  
  // Replace all routes
  static void replaceAll(String route) => Get.offAllNamed(route);
  
  // Get current route
  static String getCurrentRoute() => Get.currentRoute;
  
  // Check if route exists
  static bool hasRoute(String route) => Get.routing.current == route;
  
  // Get route arguments
  static dynamic getArguments() => Get.arguments;
  
  // Get route parameters
  static Map<String, String?> getParameters() => Get.parameters;
  
  // Get specific parameter
  static String? getParameter(String key) => Get.parameters[key];
  
  // Set route parameters
  static void setParameters(Map<String, String> parameters) {
    parameters.forEach((key, value) {
      Get.parameters[key] = value;
    });
  }
  
  // Set specific parameter
  static void setParameter(String key, String value) => Get.parameters[key] = value;
} 