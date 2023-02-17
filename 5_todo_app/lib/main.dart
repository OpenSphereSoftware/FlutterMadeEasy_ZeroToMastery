import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/0_data/data_sources/local/todo_local_hive_data_source.dart';
import 'package:todo_app/0_data/data_sources/remote/todo_remote_firebase_data_source.dart';
import 'package:todo_app/0_data/repositories/todo_repository_impl.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';

import '2_application/app/basic_app.dart';

Future<void> main() async {
  final localDataSource = ToDoLocalHiveDataSource();
  await localDataSource.init();

  runApp(
    RepositoryProvider<ToDoRepository>(
      create: (context) => ToDoRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: ToDoRemoteFirebaseDataSource(),
      ),
      child: const BasicApp(),
    ),
  );
}
