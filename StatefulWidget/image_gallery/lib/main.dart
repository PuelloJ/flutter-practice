import 'package:flutter/material.dart';
// import 'package:image_gallery/config/app_theme.dart';
import 'package:image_gallery/screens/home_gallery_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es', null);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MainAppState();
}

class _MainAppState extends State<MyApp> {
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
