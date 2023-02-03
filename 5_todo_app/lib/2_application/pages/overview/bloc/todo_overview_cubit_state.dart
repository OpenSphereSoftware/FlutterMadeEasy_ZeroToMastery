part of 'todo_overview_cubit.dart';

abstract class ToDoOverviewState extends Equatable {
  const ToDoOverviewState();

  @override
  List<Object> get props => [];
}

class ToDoOverviewLoadedState extends ToDoOverviewState {
  const ToDoOverviewLoadedState({required this.collections});

  final List<ToDoCollection> collections;

  @override
  List<Object> get props => [collections];
}

class ToDoOverviewLoadingState extends ToDoOverviewState {}

class ToDoOverviewErrorState extends ToDoOverviewState {}
