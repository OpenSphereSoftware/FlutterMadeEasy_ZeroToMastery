import 'package:flutter/material.dart';

class AddTodoButtonSmall extends StatelessWidget {
  const AddTodoButtonSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      width: 50,
      height: 50,
      child: const Icon(Icons.add_task_rounded),
    );
  }
}

class AddTodoButtonLarge extends StatelessWidget {
  const AddTodoButtonLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 0, 12),
      child: Column(children: <Widget>[
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ]),
          width: 200,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
            child: Row(
              children: const <Widget>[
                Icon(Icons.add_task_rounded),
                SizedBox(width: 20),
                Center(child: Text('Add ToDo')),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
