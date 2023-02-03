import 'package:flutter/material.dart';

class ToDoEntryItemLoading extends StatelessWidget {
  const ToDoEntryItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: replace it with shimmer loading?
    return const CheckboxListTile(
      value: false,
      onChanged: null,
      title: Text('Loading...'),
    );
  }
}
