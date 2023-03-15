import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';
import 'package:todo_app/1_domain/use_cases/load_todo_entry_ids_for_collection.dart';
import 'package:todo_app/2_application/core/page_config.dart';
import 'package:todo_app/2_application/pages/detail/bloc/todo_detail_cubit.dart';
import 'package:todo_app/2_application/pages/detail/view_states/todo_detail_error.dart';
import 'package:todo_app/2_application/pages/detail/view_states/todo_detail_loaded.dart';
import 'package:todo_app/2_application/pages/detail/view_states/todo_detail_loading.dart';

class ToDoDetailPageProvider extends StatelessWidget {
  const ToDoDetailPageProvider({
    super.key,
    required this.collectionId,
  });

  final CollectionId collectionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ToDoDetailCubit>(
      create: (context) => ToDoDetailCubit(
        collectionId: collectionId,
        loadToDoEntryIdsForCollection: LoadToDoEntryIdsForCollection(
          toDoRepository: RepositoryProvider.of<ToDoRepository>(context),
        ),
      )..fetch(),
      child: ToDoDetailPage(
        collectionId: collectionId,
      ),
    );
  }
}

class ToDoDetailPage extends StatelessWidget {
  const ToDoDetailPage({
    super.key,
    required this.collectionId,
  });

  final CollectionId collectionId;

  static const pageConfig = PageConfig(
    icon: Icons.details_rounded,
    name: 'detail',
    child: Placeholder(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoDetailCubit, ToDoDetailCubitState>(
      builder: (context, state) {
        if (state is ToDoDetailCubitLoadingState) {
          return const ToDoDetailLoading();
        } else if (state is ToDoDetailCubitLoadedState) {
          return ToDoDetailLoaded(
            collectionId: collectionId,
            entryIds: state.entryIds,
          );
        } else {
          return const ToDoDetailError();
        }
      },
    );
  }
}
