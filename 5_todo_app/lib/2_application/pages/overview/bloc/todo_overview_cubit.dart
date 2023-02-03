import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/use_cases/load_overview_collections.dart';
import 'package:todo_app/core/use_case/use_case.dart';

part 'todo_overview_cubit_state.dart';

class ToDoOverviewCubit extends Cubit<ToDoOverviewState> {
  ToDoOverviewCubit({
    ToDoOverviewState? initialState,
    required this.loadOverviewCollections,
  }) : super(initialState ?? ToDoOverviewLoadingState());

  final LoadOverviewCollections loadOverviewCollections;

  Future<void> fetchToDoOverviewItems() async {
    emit(ToDoOverviewLoadingState());
    try {
      final collectionsFuture = loadOverviewCollections.call(NoParams());

      final collections = await collectionsFuture;

      if (collections.isLeft) {
        emit(ToDoOverviewErrorState());
      } else {
        emit(ToDoOverviewLoadedState(collections: collections.right));
      }
    } on Exception {
      emit(ToDoOverviewErrorState());
    }
  }
}
