import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';

class Todo {
  final UniqueID id;
  final String title;
  final String body;
  final bool done;
  final TodoColor color;

  const Todo({
    required this.id,
    required this.body,
    required this.title,
    required this.color,
    required this.done,
  });

  factory Todo.empty() {
    return Todo(
      id: UniqueID(),
      title: "",
      body: "",
      done: false,
      color: TodoColor(
        color: TodoColor.predefinedColors[5],
      ),
    );
  }

  Todo copyWith({
    UniqueID? id,
    String? title,
    String? body,
    bool? done,
    TodoColor? color,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      done: done ?? this.done,
      color: color ?? this.color,
    );
  }
}
