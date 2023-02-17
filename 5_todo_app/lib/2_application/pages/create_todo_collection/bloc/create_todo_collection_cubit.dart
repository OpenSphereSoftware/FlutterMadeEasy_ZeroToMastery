import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/use_cases/add_todo_collection.dart';
import 'package:todo_app/core/use_case/use_case.dart';

part 'create_todo_collection_state.dart';

class CreateToDoCollectionCubit extends Cubit<CreateToDoCollectionState> {
  CreateToDoCollectionCubit({
    required this.addToDoCollection,
  }) : super(const CreateToDoCollectionState());

  final AddToDoCollection addToDoCollection;

  void titleChanged(String title) {
    emit(state.copyWith(title: title));
  }

  void colorChanged(String color) {
    emit(state.copyWith(color: color));
  }

  void submit() async {
    emit(state.copyWith(isSubmitting: true));

    await addToDoCollection.call(
      ToDoCollectionParams(
        collection: ToDoCollection.empty().copyWith(
          title: state.title,
          color: ToDoColor(colorIndex: int.tryParse(state.color ?? '') ?? 0),
        ),
      ),
    );
  }
}
