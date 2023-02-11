import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';

part 'navigation_todo_cubit_state.dart';

class NavigationTodoCubitCubit extends Cubit<NavigationTodoCubitState> {
  NavigationTodoCubitCubit() : super(const NavigationTodoCubitInitial());

  void selectedTodoItemChanged(CollectionId? selectedItem) {
    emit(NavigationTodoCubitInitial(selectedTodoItem: selectedItem));
  }

  void breakpointChanged(bool showGrid) {
    if (state.showGrid != showGrid) {
      emit(NavigationTodoCubitInitial(
        selectedTodoItem: state.selectedTodoItem,
        showGrid: showGrid,
      ));
    }
  }
}
