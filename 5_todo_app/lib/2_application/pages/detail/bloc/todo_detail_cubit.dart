import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/use_cases/load_todo_entries_for_collection.dart';
import 'package:todo_app/core/use_case/use_case.dart';

part 'todo_detail_cubit_state.dart';

class ToDoDetailCubit extends Cubit<ToDoDetailState> {
  ToDoDetailCubit({
    ToDoDetailState? initialState,
    required this.loadToDoEntriesForCollection,
    required this.collectionId,
  }) : super(initialState ?? ToDoDetailLoadingState());

  final CollectionId collectionId;
  final LoadToDoEntriesForCollection loadToDoEntriesForCollection;

  Future<void> fetchToDoEntryIdsItems() async {
    emit(ToDoDetailLoadingState());
    try {
      final entryIdsFuture = loadToDoEntriesForCollection.call(CollectionIdParam(id: collectionId));

      final entryIds = await entryIdsFuture;

      if (entryIds.isLeft) {
        emit(ToDoDetailErrorState());
      } else {
        emit(ToDoDetailLoadedState(entryIds: entryIds.right));
      }
    } on Exception {
      emit(ToDoDetailErrorState());
    }
  }
}
