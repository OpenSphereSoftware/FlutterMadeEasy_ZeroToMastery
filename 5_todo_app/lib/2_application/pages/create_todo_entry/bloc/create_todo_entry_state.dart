part of 'create_todo_entry_cubit.dart';

@immutable
class CreateToDoEntryState extends Equatable {
  final String? description;
  final String? color;
  final bool isSubmitting;

  const CreateToDoEntryState({this.description, this.color, this.isSubmitting = false});

  CreateToDoEntryState copyWith({
    String? description,
    String? color,
    bool? isSubmitting,
  }) =>
      CreateToDoEntryState(
        description: description ?? this.description,
        color: color ?? this.color,
        isSubmitting: isSubmitting ?? this.isSubmitting,
      );

  @override
  List<Object?> get props => [description, color, isSubmitting];
}
