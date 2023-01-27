part of 'navigation_todo_cubit_cubit.dart';

@immutable
abstract class NavigationTodoCubitState extends Equatable {
  final UniqueID? selectedTodoItem;

  const NavigationTodoCubitState({this.selectedTodoItem});

  @override
  List<Object?> get props => [selectedTodoItem];
}

class NavigationTodoCubitInitial extends NavigationTodoCubitState {
  const NavigationTodoCubitInitial({super.selectedTodoItem});
}
