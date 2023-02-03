import 'package:flutter/material.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';

class ToDoDetailLoaded extends StatelessWidget {
  const ToDoDetailLoaded({
    required this.entryIds,
    super.key,
  });

  final List<UniqueID> entryIds;

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
                // TODO add own widget here
                return CheckboxListTile(
                  title: Text('todoDetail.description : ${entryIds[index].value}}'),
                  value: false, //todoDetail.isDone,
                  onChanged: (value) => debugPrint('TODO needs to be implemented'),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () => debugPrint('add entry'),
                child: const Icon(
                  Icons.edit,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
