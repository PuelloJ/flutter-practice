import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getDarkTheme() => ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      );
  ThemeData getLightTheme() => ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      );
}
