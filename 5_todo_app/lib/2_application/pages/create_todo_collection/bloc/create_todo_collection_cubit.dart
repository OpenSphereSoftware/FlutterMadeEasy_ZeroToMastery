import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';

part 'create_todo_collection_state.dart';

class CreateToDoCollectionCubit extends Cubit<CreateToDoCollectionState> {
  CreateToDoCollectionCubit({
    required this.toDoRepository,
  }) : super(const CreateToDoCollectionState());

  final ToDoRepository toDoRepository;

  void titleChanged(String title) {
    emit(state.copyWith(title: title));
  }

  void colorChanged(String color) {
    emit(state.copyWith(color: color));
  }

  void submit() {
    emit(state.copyWith(isSubmitting: true));

    toDoRepository.addToDoCollection(ToDoCollection.empty().copyWith(title: state.title));
  }
}
