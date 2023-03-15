part of 'todo_overview_cubit.dart';

abstract class ToDoOverviewCubitState extends Equatable {
  const ToDoOverviewCubitState();

  @override
  List<Object> get props => [];
}

class ToDoOverviewCubitLoadingState extends ToDoOverviewCubitState {
  const ToDoOverviewCubitLoadingState();
}

class ToDoOverviewCubitErrorState extends ToDoOverviewCubitState {
  const ToDoOverviewCubitErrorState();
}

class ToDoOverviewCubitLoadedState extends ToDoOverviewCubitState {
  const ToDoOverviewCubitLoadedState({required this.collections});

  final List<ToDoCollection> collections;

  @override
  List<Object> get props => [collections];
}
