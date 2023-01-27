import 'package:flutter/material.dart';
import 'package:todo_app/1_domain/entities/Todo.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/2_application/pages/home/home_page.dart';
import 'package:todo_app/main.dart';

class TodoOverview extends StatelessWidget {
  const TodoOverview({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(Max): add loading cubit here

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => debugPrint('select ${todos[index].id}'),
        child: Card(
          color: todos[index].color.color,
          child: ListTile(
            title: Text(todos[index].title),
          ),
        ),
      ),
    );
  }
}
