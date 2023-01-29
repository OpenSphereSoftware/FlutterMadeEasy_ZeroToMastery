import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/2_application/pages/home/bloc/cubit/navigation_todo_cubit_cubit.dart';
import 'package:todo_app/main.dart';

class TodoOverview extends StatelessWidget {
  const TodoOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO(Max): add loading cubit here

    return Stack(
      children: [
        ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final item = todos[index];
            return BlocBuilder<NavigationTodoCubitCubit, NavigationTodoCubitState>(
              buildWhen: (previous, current) => previous.selectedTodoItem != current.selectedTodoItem,
              builder: (context, state) {
                final colorScheme = Theme.of(context).colorScheme;
                return ListTile(
                  selected: state.selectedTodoItem == item.id,
                  tileColor: colorScheme.surface,
                  selectedTileColor: colorScheme.surfaceVariant,
                  iconColor: item.color.color,
                  selectedColor: item.color.color,
                  onTap: () {
                    context.read<NavigationTodoCubitCubit>().selectedTodoItemChanged(item.id);

                    if (!Breakpoints.mediumAndUp.isActive(context)) {
                      context.push('/home/overview/${item.id.value}');
                    }
                  },
                  leading: const Icon(Icons.circle),
                  title: Text(item.title),
                );
              },
            );
          },
        ),
        Breakpoints.mediumAndUp.isActive(context)
            ? const SizedBox.shrink()
            : const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SmallTodoIcon(),
                ),
              ),
      ],
    );
  }
}

// TODO(Max): add on pressed state here and change it with a normal button
class SmallTodoIcon extends StatelessWidget {
  const SmallTodoIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 254, 215, 227),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
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

class LargeTodoIcon extends StatelessWidget {
  const LargeTodoIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 0, 12),
      child: Column(children: <Widget>[
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 225, 231),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            boxShadow: Breakpoints.mediumAndUp.isActive(context)
                ? null
                : <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          width: 200,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
            child: Row(
              children: const <Widget>[
                Icon(Icons.add_task_rounded),
                SizedBox(width: 20),
                Center(child: Text('Compose')),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
