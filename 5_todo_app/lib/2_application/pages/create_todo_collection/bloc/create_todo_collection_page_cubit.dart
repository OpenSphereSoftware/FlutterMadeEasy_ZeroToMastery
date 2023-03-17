import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/use_cases/create_todo_collection.dart';
import 'package:todo_app/core/use_case.dart';

part 'create_todo_collection_page_state.dart';

class CreateToDoCollectionPageCubit extends Cubit<CreateToDoCollectionPageState> {
  CreateToDoCollectionPageCubit({
    required this.createToDoCollection,
  }) : super(const CreateToDoCollectionPageState());

  final CreateToDoCollection createToDoCollection;

  void titleChanged(String title) {
    emit(state.copyWith(title: title));
  }

  void colorChanged(String color) {
    emit(state.copyWith(color: color));
  }

  Future<void> submit() async {
    final parsedColorIndex = int.tryParse(state.color ?? '') ?? 0;

    await createToDoCollection.call(ToDoCollectionParams(
      collection: ToDoCollection.empty().copyWith(
        title: state.title,
        color: ToDoColor(colorIndex: parsedColorIndex),
      ),
    ));
  }
}
