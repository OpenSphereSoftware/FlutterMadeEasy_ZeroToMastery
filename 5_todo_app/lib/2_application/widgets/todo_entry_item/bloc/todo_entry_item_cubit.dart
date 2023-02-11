import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/use_cases/load_todo_entry.dart';
import 'package:todo_app/1_domain/use_cases/update_todo_entry.dart';
import 'package:todo_app/core/use_case/use_case.dart';

part 'todo_entry_item_state.dart';

class ToDoEntryItemCubit extends Cubit<ToDoEntryItemState> {
  ToDoEntryItemCubit({
    ToDoEntryItemState? initialState,
    required this.loadToDoEntry,
    required this.updateToDoEntry,
    required this.entryId,
    required this.collectionId,
  }) : super(initialState ?? ToDoEntryItemLoadingState());

  final EntryId entryId;
  final CollectionId collectionId;
  final LoadToDoEntry loadToDoEntry;
  final UpdateToDoEntry updateToDoEntry;

  Future<void> fetchToDoEntry() async {
    emit(ToDoEntryItemLoadingState());
    try {
      final entryFuture = loadToDoEntry.call(ToDoEntryIdsParam(entryId: entryId, collectionId: collectionId));

      final entry = await entryFuture;

      if (entry.isLeft) {
        emit(ToDoEntryItemErrorState());
      } else {
        emit(ToDoEntryItemLoadedState(toDoEntry: entry.right));
      }
    } on Exception {
      emit(ToDoEntryItemErrorState());
    }
  }

  Future<void> updateStateOfEntry() async {
    try {
      final entryFuture = updateToDoEntry.call(ToDoEntryIdsParam(entryId: entryId, collectionId: collectionId));

      final entry = await entryFuture;

      if (entry.isLeft) {
        emit(ToDoEntryItemErrorState());
      } else {
        emit(ToDoEntryItemLoadedState(toDoEntry: entry.right));
      }
    } on Exception {
      emit(ToDoEntryItemErrorState());
    }
  }
}
