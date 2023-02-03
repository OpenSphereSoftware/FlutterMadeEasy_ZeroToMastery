import 'package:todo_app/1_domain/entities/unique_id.dart';

class ToDoEntry {
  final String description;
  final bool isDone;
  final UniqueID id;

  const ToDoEntry({
    required this.id,
    required this.description,
    required this.isDone,
  });

  factory ToDoEntry.empty() {
    return ToDoEntry(
      id: UniqueID(),
      description: "",
      isDone: false,
    );
  }

  ToDoEntry copyWith({
    String? description,
    bool? isDone,
  }) {
    return ToDoEntry(
      id: id,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}
