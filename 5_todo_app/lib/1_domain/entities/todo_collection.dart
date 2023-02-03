import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';

class TodoCollection {
  final UniqueID id;
  final String title;
  final TodoColor color;

  factory TodoCollection.empty() {
    return TodoCollection(
      id: UniqueID(),
      title: "",
      color: TodoColor(
        color: TodoColor.predefinedColors[5],
      ),
    );
  }

  TodoCollection({
    required this.id,
    required this.title,
    required this.color,
  });

  TodoCollection copyWith({
    String? title,
    TodoColor? color,
  }) {
    return TodoCollection(
      id: id,
      color: color ?? this.color,
      title: title ?? this.title,
    );
  }
}
