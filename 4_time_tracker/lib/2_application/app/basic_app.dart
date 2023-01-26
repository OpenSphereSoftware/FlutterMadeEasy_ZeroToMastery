import 'package:flutter/material.dart';
import 'package:time_tracker/2_application/core/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class BasicApp extends StatelessWidget {
  const BasicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TimeTracker',
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      routerConfig: routes,
    );
  }
}
