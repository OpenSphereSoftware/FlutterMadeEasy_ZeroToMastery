import 'package:flutter/material.dart';
import 'package:todo_app/1_domain/entities/todo.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';

import '2_application/app/basic_app.dart';

void main() {
  runApp(const BasicApp());
}

final List<Todo> todos = List.generate(
    100,
    (index) => Todo.empty().copyWith(
          title: 'index $index',
          body: 'body: $index, very long and so',
          color: TodoColor(
            color: TodoColor.predefinedColors[index % 5],
          ),
        ));
