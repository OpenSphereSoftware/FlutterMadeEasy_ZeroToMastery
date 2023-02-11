part of 'navigation_todo_cubit_cubit.dart';

@immutable
abstract class NavigationTodoCubitState extends Equatable {
  final CollectionId? selectedTodoItem;
  final bool? showGrid;

  const NavigationTodoCubitState({
    this.selectedTodoItem,
    this.showGrid,
  });

  @override
  List<Object?> get props => [
        selectedTodoItem,
        showGrid,
      ];
}

class NavigationTodoCubitInitial extends NavigationTodoCubitState {
  const NavigationTodoCubitInitial({
    super.selectedTodoItem,
    super.showGrid,
  });
}
