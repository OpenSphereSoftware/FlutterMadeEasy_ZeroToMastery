part of 'create_todo_collection_page_cubit.dart';

class CreateToDoCollectionPageState extends Equatable {
  final String? title;
  final String? color;

  const CreateToDoCollectionPageState({this.title, this.color});

  CreateToDoCollectionPageState copyWith({String? title, String? color}) {
    return CreateToDoCollectionPageState(
      color: color ?? this.color,
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [title, color];
}
