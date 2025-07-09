import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../../../../core/controllers/theme_controller.dart';
import '../../../../core/controllers/language_controller.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/services/api_service.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final ThemeController themeController = Get.find<ThemeController>();
  final LanguageController languageController = Get.find<LanguageController>();
  final ApiService apiService = Get.find<ApiService>();
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _multilineController = TextEditingController();
  
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateTimeRange? selectedDateRange;
  File? selectedImage;
  List<File> selectedImages = [];
  File? selectedFile;
  List<File> selectedFiles = [];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _searchController.dispose();
    _multilineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Page', style: AppTextStyles.titleLarge),
        backgroundColor: AppColors.appBarBackground,
        foregroundColor: AppColors.appBarForeground,
        actions: [
          IconButton(
            icon: Icon(themeController.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeController.toggleTheme(),
          ),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => languageController.toggleLanguage(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theme and Language Section
            _buildSectionTitle('Theme & Language'),
            _buildThemeLanguageSection(),
            
            AppWidgets.spacer(height: 24),
            
            // Cards Section
            _buildSectionTitle('Cards'),
            _buildCardsSection(),
            
            AppWidgets.spacer(height: 24),
            
            // Buttons Section
            _buildSectionTitle('Buttons'),
            _buildButtonsSection(),
            
            AppWidgets.spacer(height: 24),
            
            // Text Fields Section
            _buildSectionTitle('Text Fields'),
            _buildTextFieldsSection(),
            
            AppWidgets.spacer(height: 24),
            
            // Date & Time Selection Section
            _buildSectionTitle('Date & Time Selection'),
            _buildDateTimeSection(),
            
            AppWidgets.spacer(height: 24),
            
            // File & Image Selection Section
            _buildSectionTitle('File & Image Selection'),
            _buildFileImageSection(),
            
            AppWidgets.spacer(height: 24),
            
            // Utility Functions Section
            _buildSectionTitle('Utility Functions'),
            _buildUtilityFunctionsSection(),
            
            AppWidgets.spacer(height: 24),
            
            // API Calls Section
            _buildSectionTitle('API Calls'),
            _buildApiCallsSection(),
            
            AppWidgets.spacer(height: 100), // Bottom padding
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.headlineSmall.copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildThemeLanguageSection() {
    return AppCard(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppButtons.primary(
                  text: 'Toggle Theme',
                  onPressed: () => themeController.toggleTheme(),
                  prefix: Icon(themeController.isDarkMode ? Icons.light_mode : Icons.dark_mode),
                ),
              ),
              AppWidgets.hSpacer(width: 12),
              Expanded(
                child: AppButtons.secondary(
                  text: 'Toggle Language',
                  onPressed: () => languageController.toggleLanguage(),
                  prefix: const Icon(Icons.language),
                ),
              ),
            ],
          ),
          AppWidgets.spacer(height: 12),
          Text(
            'Current Theme: ${themeController.isDarkMode ? "Dark" : "Light"}',
            style: AppTextStyles.bodyMedium,
          ),
          Text(
            'Current Language: ${languageController.currentLanguage.languageCode}',
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildCardsSection() {
    return Column(
      children: [
        // Basic Cards
        Row(
          children: [
            Expanded(
              child: AppCards.basic(
                child: Text('Basic Card', style: AppTextStyles.bodyMedium),
              ),
            ),
            AppWidgets.hSpacer(width: 12),
            Expanded(
              child: AppCards.info(
                title: 'Info Card',
                message: 'This is an info message',
                icon: Icons.info,
              ),
            ),
          ],
        ),
        
        AppWidgets.spacer(height: 12),
        
        Row(
          children: [
            Expanded(
              child: AppCards.success(
                title: 'Success Card',
                message: 'Operation completed successfully',
                icon: Icons.check_circle,
              ),
            ),
            AppWidgets.hSpacer(width: 12),
            Expanded(
              child: AppCards.warning(
                title: 'Warning Card',
                message: 'Please check your input',
                icon: Icons.warning,
              ),
            ),
          ],
        ),
        
        AppWidgets.spacer(height: 12),
        
        AppCards.error(
          title: 'Error Card',
          message: 'Something went wrong',
          icon: Icons.error,
        ),
        
        AppWidgets.spacer(height: 12),
        
        AppCards.profile(
          name: 'John Doe',
          subtitle: 'Software Developer',
          avatarIcon: Icons.person,
          onTap: () => AppUtils.showInfo('Profile card tapped'),
        ),
        
        AppWidgets.spacer(height: 12),
        
        Row(
          children: [
            Expanded(
              child: AppCards.stats(
                title: 'Users',
                value: '1,234',
                icon: Icons.people,
                color: AppColors.primary,
              ),
            ),
            AppWidgets.hSpacer(width: 12),
            Expanded(
              child: AppCards.stats(
                title: 'Revenue',
                value: '\$12,345',
                icon: Icons.attach_money,
                color: AppColors.success,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButtonsSection() {
    return Column(
      children: [
        // Button Types
        Row(
          children: [
            Expanded(
              child: AppButtons.primary(
                text: 'Primary',
                onPressed: () => AppUtils.showSuccess('Primary button tapped'),
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.secondary(
                text: 'Secondary',
                onPressed: () => AppUtils.showInfo('Secondary button tapped'),
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.text(
                text: 'Text',
                onPressed: () => AppUtils.showWarning('Text button tapped'),
              ),
            ),
          ],
        ),
        
        AppWidgets.spacer(height: 12),
        
        // Button Sizes
        Row(
          children: [
            Expanded(
              child: AppButtons.small(
                text: 'Small',
                onPressed: () => AppUtils.showInfo('Small button'),
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.primary(
                text: 'Medium',
                onPressed: () => AppUtils.showInfo('Medium button'),
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.large(
                text: 'Large',
                onPressed: () => AppUtils.showInfo('Large button'),
              ),
            ),
          ],
        ),
        
        AppWidgets.spacer(height: 12),
        
        // Button States
        Row(
          children: [
            Expanded(
              child: AppButtons.loading(
                text: 'Loading...',
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.disabled(
                text: 'Disabled',
              ),
            ),
          ],
        ),
        
        AppWidgets.spacer(height: 12),
        
        // Button with Icons
        Row(
          children: [
            Expanded(
              child: AppButtons.primary(
                text: 'With Icon',
                prefix: const Icon(Icons.add),
                onPressed: () => AppUtils.showSuccess('Button with icon'),
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.primary(
                text: 'Icon Button',
                suffix: const Icon(Icons.arrow_forward),
                onPressed: () => AppUtils.showSuccess('Button with suffix'),
              ),
            ),
          ],
        ),
        
        AppWidgets.spacer(height: 12),
        
        // Color Buttons
        Row(
          children: [
            Expanded(
              child: AppButtons.success(
                text: 'Success',
                onPressed: () => AppUtils.showSuccess('Success button'),
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.error(
                text: 'Error',
                onPressed: () => AppUtils.showError('Error button'),
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.warning(
                text: 'Warning',
                onPressed: () => AppUtils.showWarning('Warning button'),
              ),
            ),
          ],
        ),
        
        AppWidgets.spacer(height: 12),
        
        // Full Width Button
        AppButtons.primary(
          text: 'Full Width Button',
          fullWidth: true,
          onPressed: () => AppUtils.showInfo('Full width button'),
        ),
      ],
    );
  }

  Widget _buildTextFieldsSection() {
    return Column(
      children: [
        // Basic Text Fields
        AppTextFields.email(
          controller: _emailController,
          onChanged: (value) => print('Email: $value'),
        ),
        
        AppWidgets.spacer(height: 12),
        
        AppTextFields.password(
          controller: _passwordController,
          onChanged: (value) => print('Password: $value'),
        ),
        
        AppWidgets.spacer(height: 12),
        
        AppTextFields.search(
          controller: _searchController,
          onChanged: (value) => print('Search: $value'),
        ),
        
        AppWidgets.spacer(height: 12),
        
        AppTextFields.multiline(
          controller: _multilineController,
          label: 'Multiline Text',
          hint: 'Enter multiple lines of text...',
          onChanged: (value) => print('Multiline: $value'),
        ),
        
        AppWidgets.spacer(height: 12),
        
        // Different Designs
        Row(
          children: [
            Expanded(
              child: AppTextField(
                label: 'Outlined',
                hint: 'Outlined design',
                design: AppTextFieldDesign.outlined,
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppTextField(
                label: 'Filled',
                hint: 'Filled design',
                design: AppTextFieldDesign.filled,
              ),
            ),
          ],
        ),
        
        AppWidgets.spacer(height: 12),
        
        Row(
          children: [
            Expanded(
              child: AppTextField(
                label: 'Underlined',
                hint: 'Underlined design',
                design: AppTextFieldDesign.underlined,
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppTextField(
                label: 'Rounded',
                hint: 'Rounded design',
                design: AppTextFieldDesign.rounded,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDateTimeSection() {
    return Column(
      children: [
        // Date Selection
        Row(
          children: [
            Expanded(
              child: AppButtons.primary(
                text: 'Select Date',
                prefix: const Icon(Icons.calendar_today),
                onPressed: () async {
                  final date = await AppUtils.selectDate(context: context);
                  if (date != null) {
                    setState(() => selectedDate = date);
                    AppUtils.showSuccess('Selected date: ${AppUtils.formatDate(date)}');
                  }
                },
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.secondary(
                text: 'Select Time',
                prefix: const Icon(Icons.access_time),
                onPressed: () async {
                  final time = await AppUtils.selectTime(context: context);
                  if (time != null) {
                    setState(() => selectedTime = time);
                    AppUtils.showSuccess('Selected time: ${time.format(context)}');
                  }
                },
              ),
            ),
          ],
        ),
        
        AppWidgets.spacer(height: 12),
        
        AppButtons.primary(
          text: 'Select Date Range',
          prefix: const Icon(Icons.date_range),
          fullWidth: true,
          onPressed: () async {
            final range = await AppUtils.selectDateRange(context: context);
            if (range != null) {
              setState(() => selectedDateRange = range);
              AppUtils.showSuccess(
                'Selected range: ${AppUtils.formatDate(range.start)} - ${AppUtils.formatDate(range.end)}'
              );
            }
          },
        ),
        
        AppWidgets.spacer(height: 12),
        
        // Display selected values
        if (selectedDate != null)
          Text(
            'Selected Date: ${AppUtils.formatDate(selectedDate!)}',
            style: AppTextStyles.bodyMedium,
          ),
        if (selectedTime != null)
          Text(
            'Selected Time: ${selectedTime!.format(context)}',
            style: AppTextStyles.bodyMedium,
          ),
        if (selectedDateRange != null)
          Text(
            'Selected Range: ${AppUtils.formatDate(selectedDateRange!.start)} - ${AppUtils.formatDate(selectedDateRange!.end)}',
            style: AppTextStyles.bodyMedium,
          ),
      ],
    );
  }

  Widget _buildFileImageSection() {
    return Column(
      children: [
        // Image Selection
        Row(
          children: [
            Expanded(
              child: AppButtons.primary(
                text: 'Pick Image',
                prefix: const Icon(Icons.image),
                onPressed: () async {
                  final image = await AppUtils.pickImage(context: context);
                  if (image != null) {
                    setState(() => selectedImage = image);
                    AppUtils.showSuccess('Image selected: ${image.path.split('/').last}');
                  }
                },
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.secondary(
                text: 'Take Photo',
                prefix: const Icon(Icons.camera_alt),
                onPressed: () async {
                  final image = await AppUtils.takePhoto(context: context);
                  if (image != null) {
                    setState(() => selectedImage = image);
                    AppUtils.showSuccess('Photo taken: ${image.path.split('/').last}');
                  }
                },
              ),
            ),
          ],
        ),
        
        AppWidgets.spacer(height: 12),
        
        Row(
          children: [
            Expanded(
              child: AppButtons.primary(
                text: 'Pick Multiple Images',
                prefix: const Icon(Icons.photo_library),
                onPressed: () async {
                  final images = await AppUtils.pickMultipleImages(context: context);
                  if (images.isNotEmpty) {
                    setState(() => selectedImages = images);
                    AppUtils.showSuccess('${images.length} images selected');
                  }
                },
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.secondary(
                text: 'Pick File',
                prefix: const Icon(Icons.file_present),
                onPressed: () async {
                  final file = await AppUtils.pickFile(context: context);
                  if (file != null) {
                    setState(() => selectedFile = file);
                    AppUtils.showSuccess('File selected: ${file.path.split('/').last}');
                  }
                },
              ),
            ),
          ],
        ),
        
        AppWidgets.spacer(height: 12),
        
        Row(
          children: [
            Expanded(
              child: AppButtons.primary(
                text: 'Pick Document',
                prefix: const Icon(Icons.description),
                onPressed: () async {
                  final file = await AppUtils.pickDocument(context: context);
                  if (file != null) {
                    setState(() => selectedFile = file);
                    AppUtils.showSuccess('Document selected: ${file.path.split('/').last}');
                  }
                },
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.secondary(
                text: 'Pick Video',
                prefix: const Icon(Icons.video_file),
                onPressed: () async {
                  final file = await AppUtils.pickVideo(context: context);
                  if (file != null) {
                    setState(() => selectedFile = file);
                    AppUtils.showSuccess('Video selected: ${file.path.split('/').last}');
                  }
                },
              ),
            ),
          ],
        ),
        
        AppWidgets.spacer(height: 12),
        
        AppButtons.primary(
          text: 'Pick Multiple Files',
          prefix: const Icon(Icons.folder_open),
          fullWidth: true,
          onPressed: () async {
            final files = await AppUtils.pickMultipleFiles(context: context);
            if (files.isNotEmpty) {
              setState(() => selectedFiles = files);
              AppUtils.showSuccess('${files.length} files selected');
            }
          },
        ),
        
        AppWidgets.spacer(height: 12),
        
        // Display selected files
        if (selectedImage != null)
          Text(
            'Selected Image: ${selectedImage!.path.split('/').last}',
            style: AppTextStyles.bodyMedium,
          ),
        if (selectedImages.isNotEmpty)
          Text(
            'Selected Images: ${selectedImages.length} files',
            style: AppTextStyles.bodyMedium,
          ),
        if (selectedFile != null)
          Text(
            'Selected File: ${selectedFile!.path.split('/').last} (${AppUtils.formatFileSize(selectedFile!.lengthSync())})',
            style: AppTextStyles.bodyMedium,
          ),
        if (selectedFiles.isNotEmpty)
          Text(
            'Selected Files: ${selectedFiles.length} files',
            style: AppTextStyles.bodyMedium,
          ),
      ],
    );
  }

  Widget _buildUtilityFunctionsSection() {
    return Column(
      children: [
        // Validation Functions
        Row(
          children: [
            Expanded(
              child: AppButtons.primary(
                text: 'Validate Email',
                onPressed: () {
                  final isValid = AppUtils.isValidEmail('test@example.com');
                  AppUtils.showInfo('Email validation: $isValid');
                },
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.secondary(
                text: 'Validate Phone',
                onPressed: () {
                  final isValid = AppUtils.isValidPhone('+1234567890');
                  AppUtils.showInfo('Phone validation: $isValid');
                },
              ),
            ),
          ],
        ),
        
        AppWidgets.spacer(height: 12),
        
        Row(
          children: [
            Expanded(
              child: AppButtons.primary(
                text: 'Validate URL',
                onPressed: () {
                  final isValid = AppUtils.isValidUrl('https://example.com');
                  AppUtils.showInfo('URL validation: $isValid');
                },
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.secondary(
                text: 'Validate Credit Card',
                onPressed: () {
                  final isValid = AppUtils.isValidCreditCard('4532015112830366');
                  AppUtils.showInfo('Credit card validation: $isValid');
                },
              ),
            ),
          ],
        ),
        
        AppWidgets.spacer(height: 12),
        
        // String Utilities
        Row(
          children: [
            Expanded(
              child: AppButtons.primary(
                text: 'Capitalize',
                onPressed: () {
                  final result = AppUtils.capitalize('hello world');
                  AppUtils.showInfo('Capitalized: $result');
                },
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.secondary(
                text: 'Truncate',
                onPressed: () {
                  final result = AppUtils.truncate('This is a very long text that needs to be truncated', 20);
                  AppUtils.showInfo('Truncated: $result');
                },
              ),
            ),
          ],
        ),
        
        AppWidgets.spacer(height: 12),
        
        // Number Utilities
        Row(
          children: [
            Expanded(
              child: AppButtons.primary(
                text: 'Format Number',
                onPressed: () {
                  final result = AppUtils.formatCurrency(1234567);
                  AppUtils.showInfo('Formatted: $result');
                },
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.secondary(
                text: 'Device Info',
                onPressed: () {
                  final info = AppUtils.getDeviceInfo();
                  AppUtils.showInfo('Platform: ${info['platform']}');
                },
              ),
            ),
          ],
        ),
        
       
      ],
    );
  }

  Widget _buildApiCallsSection() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppButton(
                text: 'GET Request',
                backgroundColor: AppColors.secondary,
              
                onPressed: () async {
                  AppUtils.showLoading('Making GET request...');
                  try {
                    final response = await apiService.get('/posts/1');
                    AppUtils.hideLoading();
                    AppUtils.showSuccess('GET Response: ${response.data}');
                  } catch (e) {
                    AppUtils.hideLoading();
                    AppUtils.showError('GET Error: $e');
                  }
                },
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.secondary(
                text: 'POST Request',
                onPressed: () async {
                  AppUtils.showLoading('Making POST request...');
                  try {
                    final response = await apiService.post(
                      '/posts',
                      body: {'title': 'Test Post', 'body': 'Test content'},
                    );
                    AppUtils.hideLoading();
                    AppUtils.showSuccess('POST Response: ${response.data}');
                  } catch (e) {
                    AppUtils.hideLoading();
                    AppUtils.showError('POST Error: $e');
                  }
                },
              ),
            ),
          ],
        ),
        
        AppWidgets.spacer(height: 12),
        
        Row(
          children: [
            Expanded(
              child: AppButtons.primary(
                text: 'PUT Request',
                onPressed: () async {
                  AppUtils.showLoading('Making PUT request...');
                  try {
                    final response = await apiService.put(
                      '/posts/1',
                      body: {'title': 'Updated Post', 'body': 'Updated content'},
                    );
                    AppUtils.hideLoading();
                    AppUtils.showSuccess('PUT Response: ${response.data}');
                  } catch (e) {
                    AppUtils.hideLoading();
                    AppUtils.showError('PUT Error: $e');
                  }
                },
              ),
            ),
            AppWidgets.hSpacer(width: 8),
            Expanded(
              child: AppButtons.secondary(
                text: 'DELETE Request',
                onPressed: () async {
                  AppUtils.showLoading('Making DELETE request...');
                  try {
                    final response = await apiService.delete('/posts/1');
                    AppUtils.hideLoading();
                    AppUtils.showSuccess('DELETE Response: ${response.data}');
                  } catch (e) {
                    AppUtils.hideLoading();
                    AppUtils.showError('DELETE Error: $e');
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
} 