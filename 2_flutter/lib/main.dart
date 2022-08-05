import 'package:flutter/material.dart';
import 'package:flutterbasics/presentation/navigation_example_screens/screen_one.dart';
import 'package:flutterbasics/presentation/navigation_example_screens/screen_two.dart';
import 'package:flutterbasics/root_bottom_navigation.dart';
import 'package:flutterbasics/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const RootBottomNavigation(),
      routes: <String, WidgetBuilder>{
        '/root': (BuildContext context) => const RootBottomNavigation(),
        '/screenOne': (BuildContext context) => const ScreenOne(),
        '/screenTwo': (BuildContext context) => const ScreenTwo(),
      },
    );
  }
}
