import 'package:flutter/material.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/main.dart';

class TodoDetail extends StatelessWidget {
  const TodoDetail({
    super.key,
    required this.id,
  });

  final UniqueID id;

  @override
  Widget build(BuildContext context) {
    // TODO(Max): load correct todo here
    final todo = todos.firstWhere((element) => element.id == id);

    return Scaffold(
      backgroundColor: todo.color.color,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(todo.title),
          Text(todo.body),
        ],
      ),
    );
  }
}
