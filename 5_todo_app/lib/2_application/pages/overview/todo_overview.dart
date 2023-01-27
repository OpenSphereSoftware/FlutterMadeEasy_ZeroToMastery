import 'package:flutter/material.dart';
import 'package:todo_app/1_domain/entities/Todo.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';

class TodoOverview extends StatelessWidget {
  const TodoOverview({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(Max): add loading cubit here
    final List<Todo> todos = List.generate(
        100,
        (index) => Todo.empty().copyWith(
              title: 'index $index',
              color: TodoColor(
                color: TodoColor.predefinedColors[index % 5],
              ),
            ));

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
