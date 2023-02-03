import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';

class ToDoCollection {
  final UniqueID id;
  final String title;
  final TodoColor color;

  factory ToDoCollection.empty() {
    return ToDoCollection(
      id: UniqueID(),
      title: "",
      color: TodoColor(
        color: TodoColor.predefinedColors[5],
      ),
    );
  }

  ToDoCollection({
    required this.id,
    required this.title,
    required this.color,
  });

  ToDoCollection copyWith({
    String? title,
    TodoColor? color,
  }) {
    return ToDoCollection(
      id: id,
      color: color ?? this.color,
      title: title ?? this.title,
    );
  }
}
