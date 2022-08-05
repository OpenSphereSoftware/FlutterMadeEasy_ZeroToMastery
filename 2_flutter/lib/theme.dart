import 'package:flutter/material.dart';

// about Material 3(https://m3.material.io/) and the useMaterial3 flag(https://api.flutter.dev/flutter/material/ThemeData/useMaterial3.html)

class AppTheme {
  AppTheme._();

  static const _primaryColorLight = Colors.lightBlueAccent;

  static const _primaryColorDark = Colors.lightGreenAccent;

  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColorLight,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColorDark,
      brightness: Brightness.dark,
    ),
  );
}
