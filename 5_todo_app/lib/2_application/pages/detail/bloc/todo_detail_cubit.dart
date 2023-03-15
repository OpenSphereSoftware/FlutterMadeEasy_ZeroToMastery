import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/use_cases/load_todo_entry_ids_for_collection.dart';
import 'package:todo_app/core/use_case.dart';

part 'todo_detail_cubit_state.dart';

class ToDoDetailCubit extends Cubit<ToDoDetailCubitState> {
  ToDoDetailCubit({
    required this.collectionId,
    required this.loadToDoEntryIdsForCollection,
  }) : super(ToDoDetailCubitLoadingState());

  final CollectionId collectionId;
  final LoadToDoEntryIdsForCollection loadToDoEntryIdsForCollection;

  Future<void> fetch() async {
    emit(ToDoDetailCubitLoadingState());
    try {
      final entryIds = await loadToDoEntryIdsForCollection.call(
        CollectionIdParam(collectionId: collectionId),
      );

      if (entryIds.isLeft) {
        emit(ToDoDetailCubitErrorState());
      } else {
        emit(ToDoDetailCubitLoadedState(entryIds: entryIds.right));
      }
    } on Exception {
      emit(ToDoDetailCubitErrorState());
    }
  }
}
