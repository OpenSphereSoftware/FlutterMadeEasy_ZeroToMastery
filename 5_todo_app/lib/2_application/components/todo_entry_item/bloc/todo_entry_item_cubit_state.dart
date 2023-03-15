part of 'todo_entry_item_cubit.dart';

abstract class ToDoEntryItemState extends Equatable {
  const ToDoEntryItemState();

  @override
  List<Object> get props => [];
}

class ToDoEntryItemLoadingState extends ToDoEntryItemState {}

class ToDoEntryItemErrorState extends ToDoEntryItemState {}

class ToDoEntryItemLoadedState extends ToDoEntryItemState {
  const ToDoEntryItemLoadedState({required this.toDoEntry});

  final ToDoEntry toDoEntry;

  @override
  List<Object> get props => [toDoEntry];
}
