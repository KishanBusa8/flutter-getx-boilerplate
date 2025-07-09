# Getx BoilerPlate

A Flutter application built with GetX for state management, featuring comprehensive theming, localization, and API services.

## Features

- 🎨 **Dynamic Theming**: Light and dark mode support with automatic color adaptation
- 🌍 **Multi-language Support**: Support for multiple languages with RTL support
- 🔄 **GetX State Management**: Complete state management solution
- 🌐 **API Service**: Comprehensive HTTP client with error handling
- 📱 **Responsive Design**: Adaptive UI for different screen sizes
- 🎯 **Type Safety**: Full TypeScript-like type safety with Dart
- 🛠 **Modular Architecture**: Clean and scalable project structure

## Project Structure

```
lib/
├── core/
│   ├── controllers/
│   │   ├── theme_controller.dart      # Theme management (dark/light mode)
│   │   └── language_controller.dart   # Language/localization management
│   ├── services/
│   │   └── api_service.dart          # HTTP client and API handling
│   ├── theme/
│   │   ├── app_colors.dart           # Color scheme (light/dark)
│   │   ├── app_text_styles.dart      # Text styles with theme adaptation
│   │   └── app_theme.dart            # Complete theme configuration
│   ├── routes/
│   │   └── app_routes.dart           # Route definitions and navigation
│   ├── constants/
│   │   └── api_constants.dart        # API endpoints and constants
│   └── utils/
│       └── app_utils.dart            # Utility functions and widgets
├── features/                         # Feature-based modules (to be added)
│   ├── auth/
│   ├── home/
│   ├── profile/
│   └── settings/
└── main.dart                         # App entry point
```

## Getting Started

### Prerequisites

- Flutter SDK (3.6.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd flutter-getx-boilerplate
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Dependencies

### Core Dependencies
- **get**: ^4.6.6 - State management, routing, and dependency injection
- **shared_preferences**: ^2.2.2 - Local data persistence
- **http**: ^1.1.0 - HTTP client for API calls
- **flutter_localizations**: SDK - Internationalization support

## Architecture

### State Management with GetX

The app uses GetX for comprehensive state management:

- **Controllers**: Manage business logic and state
- **Reactive Programming**: Automatic UI updates with `.obs` variables
- **Dependency Injection**: Automatic controller lifecycle management

### Theme System

The theme system automatically adapts to light/dark mode:

```dart
// Colors automatically adapt to theme
Color primaryColor = AppColors.primary;

// Text styles automatically use correct colors
TextStyle titleStyle = AppTextStyles.titleLarge;
```

### API Service

The API service provides a clean interface for HTTP requests:

```dart
// GET request
final response = await ApiService.to.get('/users');

// POST request
final response = await ApiService.to.post('/users', body: userData);

// Handle response
if (response.isSuccess) {
  final data = response.data;
} else {
  print(response.message);
}
```

## Usage Examples

### Theme Management

```dart
// Get theme controller
final themeController = Get.find<ThemeController>();

// Toggle theme
themeController.toggleTheme();

// Set specific theme
themeController.setThemeMode(ThemeMode.dark);

// Check current theme
bool isDark = themeController.isDarkMode;
```

### Language Management

```dart
// Get language controller
final languageController = Get.find<LanguageController>();

// Change language
languageController.changeLanguage('es', 'ES');

// Get current language
String languageName = languageController.getCurrentLanguageName();

// Check RTL support
bool isRTL = languageController.isRTL();
```

### Using Colors and Text Styles

```dart
// Colors automatically adapt to theme
Container(
  color: AppColors.primary,
  child: Text(
    'Hello World',
    style: AppTextStyles.headlineLarge,
  ),
)

// Custom text style
Text(
  'Custom Text',
  style: AppTextStyles.custom(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
)
```

### API Calls

```dart
// Simple GET request
final response = await ApiService.to.get('/api/users');

// POST with body
final response = await ApiService.to.post(
  '/api/users',
  body: {
    'name': 'John Doe',
    'email': 'john@example.com',
  },
);

// Handle response
if (response.isSuccess) {
  AppUtils.showSuccess('Data loaded successfully');
  final data = response.data;
} else {
  AppUtils.showError(response.message);
}
```

### Utility Functions

```dart
// Show loading
AppUtils.showLoading('Loading data...');

// Hide loading
AppUtils.hideLoading();

// Show snackbars
AppUtils.showSuccess('Operation successful');
AppUtils.showError('Something went wrong');
AppUtils.showWarning('Please check your input');
AppUtils.showInfo('New feature available');

// Show confirmation dialog
final confirmed = await AppUtils.showConfirmation(
  title: 'Delete Item',
  message: 'Are you sure you want to delete this item?',
);
```

## Adding New Features

### 1. Create Feature Structure

```
lib/features/your_feature/
├── data/
│   ├── models/
│   ├── repositories/
│   └── datasources/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── controllers/
    ├── pages/
    └── widgets/
```

### 2. Add Routes

```dart
// In app_routes.dart
static const String yourFeature = '/your-feature';

// Add to getPages list
GetPage(
  name: yourFeature,
  page: () => const YourFeaturePage(),
  transition: Transition.rightToLeft,
),
```

### 3. Create Controller

```dart
class YourFeatureController extends GetxController {
  final _data = <String>[].obs;
  
  List<String> get data => _data;
  
  @override
  void onInit() {
    super.onInit();
    loadData();
  }
  
  Future<void> loadData() async {
    // Your logic here
  }
}
```

## Configuration

### API Configuration

Update the base URL in `lib/core/constants/api_constants.dart`:

```dart
static const String baseUrl = 'https://your-api-url.com/v1';
```

### Theme Customization

Modify colors in `lib/core/theme/app_colors.dart`:

```dart
static Color get primary => _themeController.isDarkMode 
  ? const Color(0xFF64B5F6) 
  : const Color(0xFF1976D2);
```

### Adding New Languages

Add new locales in `lib/core/controllers/language_controller.dart`:

```dart
final _supportedLocales = <Locale>[
  const Locale('en', 'US'),
  const Locale('es', 'ES'),
  // Add your new locale here
  const Locale('your', 'CODE'),
].obs;
```

## Best Practices

1. **Use GetX Controllers**: Always use GetX controllers for state management
2. **Theme-Aware Colors**: Always use `AppColors` instead of hardcoded colors
3. **Consistent Text Styles**: Use `AppTextStyles` for consistent typography
4. **Error Handling**: Always handle API errors gracefully
5. **Loading States**: Show loading indicators for async operations
6. **Type Safety**: Use proper types for all variables and functions

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please open an issue in the repository or contact the development team.

---

**Note**: This is a template project structure. You can modify and extend it according to your specific requirements.
