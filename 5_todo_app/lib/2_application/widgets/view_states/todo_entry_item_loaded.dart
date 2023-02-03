import 'package:flutter/material.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';

class ToDoEntryItemLoaded extends StatelessWidget {
  const ToDoEntryItemLoaded({
    required this.entry,
    super.key,
  });

  final ToDoEntry entry;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(entry.description),
      value: entry.isDone,
      onChanged: (value) => debugPrint('TODO needs to be implemented'),
    );
  }
}
