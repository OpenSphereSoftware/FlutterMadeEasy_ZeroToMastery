import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/2_application/pages/create_todo_entry/create_todo_entry.dart';
import 'package:todo_app/2_application/widgets/todo_entry_item/todo_entry_item.dart';

class ToDoDetailLoaded extends StatelessWidget {
  const ToDoDetailLoaded({
    required this.entryIds,
    required this.collectionId,
    super.key,
  });

  final CollectionId collectionId;
  final List<EntryId> entryIds;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: entryIds.length,
              itemBuilder: (context, index) {
                return ToDoEntryItemProvider(
                  entryId: entryIds[index],
                  collectionId: collectionId,
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () => context.push(
                  '/home/overview/${CreateToDoEntry.page.key}',
                  extra: collectionId,
                ),
                child: const Icon(
                  Icons.add_rounded,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
