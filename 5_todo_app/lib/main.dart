import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as ui_auth;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/0_data/data_sources/local/hive_local_data_source.dart';
import 'package:todo_app/0_data/data_sources/remote/firestore_remote_data_source.dart';
import 'package:todo_app/0_data/repositories/todo_repository_mixed.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';
import 'package:todo_app/2_application/app/basic_app.dart';
import 'package:todo_app/2_application/app/cubit/auth_cubit.dart';
import 'package:todo_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  if (!kIsWeb || !kDebugMode) {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  GoRouter.optionURLReflectsImperativeAPIs = true;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ui_auth.FirebaseUIAuth.configureProviders([
    ui_auth.PhoneAuthProvider(),
  ]);

  final localDataSource = HiveLocalDataSource();
  await localDataSource.init();

  final remoteDataSource = FirestoreRemoteDataSource();

  final authCubit = AuthCubit();

  FirebaseAuth.instance.authStateChanges().listen((user) {
    authCubit.authStateChanged(user: user);
  });

  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: const [Locale('en', 'US'), Locale('de', 'DE')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      // startLocale: Locale('de', 'DE'),
      child: RepositoryProvider<ToDoRepository>(
        create: (context) => ToDoRepositoryMixed(
          remoteSource: remoteDataSource,
          localDataSource: localDataSource,
        ),
        child: BlocProvider<AuthCubit>(
          create: (context) => authCubit,
          child: const BasicApp(),
        ),
      ),
    ),
  );
}
