import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'settings/app_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: AppSettings.themeMode,
      builder: (_, themeMode, __) {
        return ValueListenableBuilder<Color>(
          valueListenable: AppSettings.accentColor,
          builder: (_, accentColor, __) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'GeoTrail',
              themeMode: themeMode,
              darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
                scaffoldBackgroundColor: const Color(0xFF121212),
                colorScheme: ColorScheme.dark(
                  primary: accentColor,
                  secondary: accentColor,
                  surface: const Color(0xFF1E1E1E),
                ),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color(0xFF121212),
                  elevation: 0,
                  scrolledUnderElevation: 0,
                ),
              ),
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(seedColor: accentColor),
              ),
              home: const HomePage(),
            );
          },
        );
      },
    );
  }
}
