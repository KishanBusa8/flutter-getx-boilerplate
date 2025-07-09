import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'core/controllers/theme_controller.dart';
import 'core/controllers/language_controller.dart';
import 'core/services/api_service.dart';
import 'core/theme/app_theme.dart';
import 'core/routes/app_routes.dart';
import 'features/demo/presentation/pages/demo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize controllers
  Get.put(ThemeController());
  Get.put(LanguageController());
  Get.put(ApiService());
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final languageController = Get.find<LanguageController>();
    
    return Obx(() => GetMaterialApp(
      title: 'Getx Boilerplate',
      debugShowCheckedModeBanner: false,
      
      // Theme configuration
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.themeMode,
      
      // Localization configuration
      locale: languageController.currentLocale,
      supportedLocales: languageController.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      
      // Routing configuration
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.getPages,
      
      // Default transition
      defaultTransition: Transition.fade,
      
      // RTL support
      textDirection: languageController.isRTL() ? TextDirection.rtl : TextDirection.ltr,
    ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final languageController = Get.find<LanguageController>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx Boilerplate'),
        centerTitle: true,
        actions: [
          // Theme toggle button
          IconButton(
            icon: Obx(() => Icon(
              themeController.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            )),
            onPressed: () => themeController.toggleTheme(),
          ),
          // Language menu
          PopupMenuButton<String>(
            icon: const Icon(Icons.language),
            onSelected: (languageCode) {
              switch (languageCode) {
                case 'en':
                  languageController.changeLanguage('en', 'US');
                  break;
                case 'es':
                  languageController.changeLanguage('es', 'ES');
                  break;
                case 'fr':
                  languageController.changeLanguage('fr', 'FR');
                  break;
                case 'de':
                  languageController.changeLanguage('de', 'DE');
                  break;
                case 'hi':
                  languageController.changeLanguage('hi', 'IN');
                  break;
                case 'ar':
                  languageController.changeLanguage('ar', 'SA');
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'en',
                child: Text('English'),
              ),
              const PopupMenuItem(
                value: 'es',
                child: Text('Español'),
              ),
              const PopupMenuItem(
                value: 'fr',
                child: Text('Français'),
              ),
              const PopupMenuItem(
                value: 'de',
                child: Text('Deutsch'),
              ),
              const PopupMenuItem(
                value: 'hi',
                child: Text('हिंदी'),
              ),
              const PopupMenuItem(
                value: 'ar',
                child: Text('العربية'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo or icon
            const Icon(
              Icons.security,
              size: 100,
            ),
            const SizedBox(height: 20),
            
            // App title
            Text(
              'Getx Boilerplate', 
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            
            // App description
            Text(
              'Your digital security companion',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),
            
            // Current theme info
            Obx(() => Text(
              'Current Theme: ${themeController.isDarkMode ? 'Dark' : 'Light'}',
              style: Theme.of(context).textTheme.bodyMedium,
            )),
            const SizedBox(height: 10),
            
            // Current language info
            Obx(() => Text(
              'Current Language: ${languageController.getCurrentLanguageName()}',
              style: Theme.of(context).textTheme.bodyMedium,
            )),
            const SizedBox(height: 30),
            
            // Demo buttons
            ElevatedButton(
              onPressed: () => themeController.toggleTheme(),
              child: const Text('Toggle Theme'),
            ),
            const SizedBox(height: 10),
            
            ElevatedButton(
              onPressed: () {
                // Demo API call
                final apiService = Get.find<ApiService>();
                apiService.get('/test').then((response) {
                  if (response.isSuccess) {
                    Get.snackbar(
                      'Success',
                      'API call successful',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    Get.snackbar(
                      'Error',
                      response.message,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                });
              },
              child: const Text('Test API Call'),
            ),
            const SizedBox(height: 10),
            
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  'Info',
                  'This is a demo snackbar',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const Text('Show Snackbar'),
            ),
            const SizedBox(height: 10),
            
            ElevatedButton(
              onPressed: () {
                Get.to(() => const DemoPage());
              },
              child: const Text('Open Demo Page'),
            ),
          ],
        ),
      ),
    );
  }
}
