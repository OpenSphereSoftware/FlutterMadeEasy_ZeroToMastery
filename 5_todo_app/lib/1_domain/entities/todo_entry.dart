import 'package:todo_app/1_domain/entities/unique_id.dart';

class TodoEntry {
  final String description;
  final bool isDone;
  final UniqueID id;

  const TodoEntry({
    required this.id,
    required this.description,
    required this.isDone,
  });

  factory TodoEntry.empty() {
    return TodoEntry(
      id: UniqueID(),
      description: "",
      isDone: false,
    );
  }

  TodoEntry copyWith({
    String? description,
    bool? isDone,
  }) {
    return TodoEntry(
      id: id,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}
