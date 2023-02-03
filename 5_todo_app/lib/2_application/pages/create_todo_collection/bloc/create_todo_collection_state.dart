part of 'create_todo_collection_cubit.dart';

@immutable
class CreateToDoCollectionState extends Equatable {
  final String? title;
  final String? color;
  final bool isSubmitting;

  const CreateToDoCollectionState({this.title, this.color, this.isSubmitting = false});

  CreateToDoCollectionState copyWith({
    String? title,
    String? color,
    bool? isSubmitting,
  }) =>
      CreateToDoCollectionState(
        title: title ?? this.title,
        color: color ?? this.color,
        isSubmitting: isSubmitting ?? this.isSubmitting,
      );

  @override
  List<Object?> get props => [title, color, isSubmitting];
}
