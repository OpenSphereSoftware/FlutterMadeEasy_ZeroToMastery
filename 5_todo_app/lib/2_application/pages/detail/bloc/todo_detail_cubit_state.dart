part of 'todo_detail_cubit.dart';

@immutable
abstract class ToDoDetailState extends Equatable {
  const ToDoDetailState();

  @override
  List<Object> get props => [];
}

class ToDoDetailLoadedState extends ToDoDetailState {
  const ToDoDetailLoadedState({required this.entryIds});

  final List<EntryId> entryIds;

  @override
  List<Object> get props => [entryIds];
}

class ToDoDetailLoadingState extends ToDoDetailState {}

class ToDoDetailErrorState extends ToDoDetailState {}
