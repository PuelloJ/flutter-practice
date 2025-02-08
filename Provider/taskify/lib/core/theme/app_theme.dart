import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.orange,
        ),
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.orange,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
        ),
      );
}
