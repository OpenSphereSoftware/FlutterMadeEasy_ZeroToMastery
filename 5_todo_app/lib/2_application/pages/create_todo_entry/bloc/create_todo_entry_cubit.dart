import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/use_cases/add_todo_entry.dart';
import 'package:todo_app/core/use_case/use_case.dart';

part 'create_todo_entry_state.dart';

class CreateToDoEntryCubit extends Cubit<CreateToDoEntryState> {
  CreateToDoEntryCubit({
    required this.collectionId,
    required this.addToDoEntry,
  }) : super(const CreateToDoEntryState());

  final CollectionId collectionId;
  final AddToDoEntry addToDoEntry;

  void descriptionChanged(String description) {
    emit(state.copyWith(description: description));
  }

  void submit() {
    emit(state.copyWith(isSubmitting: true));

    addToDoEntry.call(ToDoEntryParams(
      entry: ToDoEntry.empty().copyWith(description: state.description),
      collectionId: collectionId,
    ));
  }
}
