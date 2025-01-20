import 'package:flutter/material.dart';
// import 'package:image_gallery/config/app_theme.dart';
import 'package:image_gallery/screens/home_gallery_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isDarkMode = true;

  void _changeTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: AppTheme().getLightTheme(),
      // darkTheme: AppTheme().getDarkTheme(),
      // themeMode: ThemeMode.system,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: HomeGalleryScreen(
        changeTheme: _changeTheme,
        darkMode: isDarkMode,
      ),
    );
  }
}
