import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';

class ToDoCollection {
  final CollectionId id;
  final String title;
  final ToDoColor color;

  ToDoCollection({
    required this.id,
    required this.title,
    required this.color,
  });

  ToDoCollection copyWith({
    String? title,
    ToDoColor? color,
  }) {
    return ToDoCollection(
      id: id,
      title: title ?? this.title,
      color: color ?? this.color,
    );
  }

  factory ToDoCollection.empty() {
    return ToDoCollection(
      id: CollectionId(),
      title: '',
      color: ToDoColor(
        colorIndex: 0,
      ),
    );
  }
}
