part of 'create_todo_entry_page_cubit.dart';

class CreateToDoEntryPageState extends Equatable {
  final FormValue<String?>? description;

  const CreateToDoEntryPageState({this.description});

  CreateToDoEntryPageState copyWith({FormValue<String?>? description}) {
    return CreateToDoEntryPageState(
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [description];
}
