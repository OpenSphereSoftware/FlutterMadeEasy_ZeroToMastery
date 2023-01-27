import 'package:flutter/material.dart';
import 'package:todo_app/1_domain/entities/Todo.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';

class TodoOverview extends StatelessWidget {
  const TodoOverview({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(Max): add loading cubit here

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) => Card(
        color: todos[index].color.color,
        child: ListTile(
          title: Text(todos[index].title),
        ),
      ),
    );
  }
}
