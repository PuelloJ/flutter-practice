import 'package:flutter/material.dart';
import 'package:taskify/core/constants/taskify_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 0,
        ),
        // floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //   backgroundColor: Colors.amber,
        //   foregroundColor: Colors.black,
        // ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: TaskifyColors.taskifyColorPrimary,
          brightness: Brightness.dark,
        ),
        // primaryColor: TaskifyColors.taskifyColorPrimary,
        // textTheme: const TextTheme(
        //   headlineLarge: TextStyle(
        //     fontSize: 50,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.white,
        //   ),
        // headline2: TextStyle(
        //   fontSize: 30,
        //   fontWeight: FontWeight.bold,
        //   color: Colors.white,
        // ),
        // headline3: TextStyle(
        //   fontSize: 20,
        //   fontWeight: FontWeight.bold,
        //   color: Colors.white,
        // ),
        // headline4: TextStyle(
        //   fontSize: 15,
        //   fontWeight: FontWeight.bold,
        //   color: Colors.white,
        // ),
        // headline5: TextStyle(
        //   fontSize: 10,
        //   fontWeight: FontWeight.bold,
        //   color: Colors.white,
        // ),
        // ),
      );
}
