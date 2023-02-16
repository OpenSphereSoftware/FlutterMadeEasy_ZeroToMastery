import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/2_application/pages/create_todo_collection/create_todo_collection.dart';

class AddCollectionButton extends StatelessWidget {
  const AddCollectionButton({super.key, this.isLarge = false});

  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    if(isLarge){
      // TODO(Max): add correct size for medium layout
      return FloatingActionButton.extended(
        heroTag: 'add-collection',
        onPressed: () {
          context.push('/home/overview/${CreateToDoCollection.page.key}');
        },
        label: const Text('Add Collection'),
        icon: const Icon(Icons.add_task_rounded),
      );
    } else {
      return FloatingActionButton(
        heroTag: 'add-collection',
        onPressed: () {
          context.push('/home/overview/${CreateToDoCollection.page.key}');
        },
        child: const Icon(Icons.add_task_rounded),
      );
    }
  }
}
