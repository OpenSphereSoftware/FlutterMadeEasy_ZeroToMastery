import 'package:flutter/material.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';

import '2_application/app/basic_app.dart';

void main() {
  runApp(const BasicApp());
}

final List<TodoCollection> todos = List.generate(
  100,
  (index) => TodoCollection.empty().copyWith(
    title: 'index $index',
    color: TodoColor(
      color: TodoColor.predefinedColors[index % 5],
    ),
  ),
);

final List<TodoEntry> todo = List.generate(
  100,
  (index) => TodoEntry(
    id: UniqueID.fromUniqueString(index.toString()),
    description: 'description $index',
    isDone: false,
  ),
);
