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

    return ListView.builder(
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
    );
  }
}
