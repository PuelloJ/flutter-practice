import 'package:flutter/material.dart';
import 'package:taskify/core/theme/app_theme.dart';
import 'package:taskify/presentation/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseño Bento en Flutter',
      theme: AppTheme.darkTheme,
      home: HomeScreen(),
    );
  }
}
