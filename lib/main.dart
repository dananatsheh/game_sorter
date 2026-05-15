import 'package:flutter/material.dart';
import 'utils/app_colors.dart';
import 'view/onboarding_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GG',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        // Use default font to avoid rendering issues on emulator
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ),
      home: const OnboardingPage(),
    );
  }
}
