part of 'create_todo_entry_cubit.dart';

@immutable
class CreateToDoEntryState extends Equatable {
  final String? title;
  final String? color;
  final bool isSubmitting;

  const CreateToDoEntryState({this.title, this.color, this.isSubmitting = false});

  CreateToDoEntryState copyWith({
    String? title,
    String? color,
    bool? isSubmitting,
  }) =>
      CreateToDoEntryState(
        title: title ?? this.title,
        color: color ?? this.color,
        isSubmitting: isSubmitting ?? this.isSubmitting,
      );

  @override
  List<Object?> get props => [title, color, isSubmitting];
}
