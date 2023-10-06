import 'package:alchemist/alchemist.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/2_application/app/cubit/auth_cubit.dart';
import 'package:todo_app/2_application/pages/dashboard/dashboard_page.dart';
import 'package:todo_app/2_application/pages/home/home_page.dart';

void main() {
  Widget setupWidgetUnderTest() => EasyLocalization(
        supportedLocales: const [Locale('en')],
        path: 'assets/translations',
        startLocale: const Locale('en'),
        useOnlyLangCode: true,
        child: BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
          child: HomePageProvider(
            tab: DasboardPage.pageConfig.name,
          ),
        ),
      );

  group('HomePage Golden Tests', () {
    goldenTest(
      'renders correctly for small breakpoint',
      fileName: 'home_page_small',
      builder: () => GoldenTestScenario(
        constraints: const BoxConstraints(
          minWidth: 300,
          maxWidth: 300,
          maxHeight: 800,
          minHeight: 800,
        ),
        name: 'small',
        child: setupWidgetUnderTest(),
      ),
    );
    goldenTest(
      'renders correctly for medium breakpoint',
      fileName: 'home_page_medium',
      builder: () => GoldenTestScenario(
        constraints: const BoxConstraints(
          minWidth: 600,
          maxWidth: 600,
          maxHeight: 800,
          minHeight: 800,
        ),
        name: 'medium',
        child: setupWidgetUnderTest(),
      ),
    );

    goldenTest(
      'renders correctly for large breakpoint',
      fileName: 'home_page_large',
      builder: () => GoldenTestScenario(
        constraints: const BoxConstraints(
          minWidth: 840,
          maxWidth: 840,
          maxHeight: 800,
          minHeight: 800,
        ),
        name: 'large',
        child: setupWidgetUnderTest(),
      ),
    );
  });
}
