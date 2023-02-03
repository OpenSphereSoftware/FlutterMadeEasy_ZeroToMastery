import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/use_cases/load_todo_entries_for_collection.dart';
import 'package:todo_app/2_application/core/page_route_config.dart';
import 'package:todo_app/2_application/pages/detail/bloc/todo_detail_cubit.dart';
import 'package:todo_app/2_application/pages/detail/view_states/todo_detail_error.dart';
import 'package:todo_app/2_application/pages/detail/view_states/todo_detail_loaded.dart';
import 'package:todo_app/2_application/pages/detail/view_states/todo_detail_loading.dart';

class ToDoDetailProvider extends StatelessWidget {
  const ToDoDetailProvider({
    super.key,
    required this.collectionId,
  });

  final UniqueID collectionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoDetailCubit(
        collectionId: collectionId,
        loadToDoEntriesForCollection: LoadToDoEntriesForCollection(
          toDoRepository: RepositoryProvider.of(context),
        ),
      )..fetchToDoEntryIdsItems(),
      child: TodoDetail(
        collectionId: collectionId,
      ),
    );
  }
}

class TodoDetail extends StatelessWidget {
  const TodoDetail({
    super.key,
    required this.collectionId,
  });

  final UniqueID collectionId;

  // TODO check if needed
  static const pageConfig = PageRouteConfig(
    key: 'todo_detail',
    icon: Icons.check_box_rounded,
    child: Text('dashboard'),
  );



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoDetailCubit, ToDoDetailState>(
      builder: (context, state) {
        if (state is ToDoDetailLoadingState) {
          return const ToDoDetailLoading();
        } else if (state is ToDoDetailLoadedState) {
          return ToDoDetailLoaded(
            entryIds: state.entryIds,
          );
        }
        return const ToDoDetailError();
      },
    );
  }
}
