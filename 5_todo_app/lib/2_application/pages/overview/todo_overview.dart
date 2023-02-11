import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/1_domain/use_cases/load_overview_collections.dart';
import 'package:todo_app/2_application/pages/overview/bloc/todo_overview_cubit.dart';
import 'package:todo_app/2_application/pages/overview/view_states/todo_overview_error.dart';
import 'package:todo_app/2_application/pages/overview/view_states/todo_overview_loaded.dart';
import 'package:todo_app/2_application/pages/overview/view_states/todo_overview_loading.dart';

class ToDoOverviewProvider extends StatelessWidget {
  const ToDoOverviewProvider({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('ToDoOverviewProvider build');
    return BlocProvider(
      create: (context) => ToDoOverviewCubit(
        loadOverviewCollections: LoadOverviewCollections(
          toDoRepository: RepositoryProvider.of(context),
        ),
      )..fetchToDoOverviewItems(),
      child: const ToDoOverview(),
    );
  }
}

class ToDoOverview extends StatelessWidget {
  const ToDoOverview({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('ToDoOverview build');
    return BlocBuilder<ToDoOverviewCubit, ToDoOverviewState>(
      builder: (context, state) {
        if (state is ToDoOverviewLoadingState) {
          return const ToDoOverviewLoading();
        } else if (state is ToDoOverviewLoadedState) {
          return ToDoOverviewLoaded(
            collections: state.collections,
          );
        }
        return const ToDoOverviewError();
      },
    );
  }
}
