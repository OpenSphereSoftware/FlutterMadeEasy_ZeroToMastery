import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/use_cases/add_todo_entry.dart';
import 'package:todo_app/core/use_case/use_case.dart';

part 'create_todo_entry_state.dart';

class CreateToDoEntryCubit extends Cubit<CreateToDoEntryState> {
  CreateToDoEntryCubit({
    required this.addToDoEntry,
  }) : super(const CreateToDoEntryState());

  final AddToDoEntry addToDoEntry;

  void titleChanged(String title) {
    emit(state.copyWith(title: title));
  }

  void colorChanged(String color) {
    emit(state.copyWith(color: color));
  }

  void submit() {
    emit(state.copyWith(isSubmitting: true));

    addToDoEntry.call(ToDoEntryParams(entry: ToDoEntry.empty().copyWith(description: state.title)));
  }
}
