part of 'todo_detail_cubit.dart';

abstract class ToDoDetailCubitState extends Equatable {
  const ToDoDetailCubitState();

  @override
  List<Object> get props => [];
}

class ToDoDetailCubitLoadingState extends ToDoDetailCubitState {}

class ToDoDetailCubitErrorState extends ToDoDetailCubitState {}

class ToDoDetailCubitLoadedState extends ToDoDetailCubitState {
  const ToDoDetailCubitLoadedState({required this.entryIds});

  final List<EntryId> entryIds;

  @override
  List<Object> get props => [entryIds];
}
