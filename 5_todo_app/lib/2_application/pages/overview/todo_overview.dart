import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/2_application/pages/home/bloc/cubit/navigation_todo_cubit_cubit.dart';
import 'package:todo_app/main.dart';

class TodoOverview extends StatelessWidget {
  const TodoOverview({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(Max): add loading cubit here

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final item = todos[index];
        return GestureDetector(
          // TODO(Max): use a callback here
          onTap: () {
            context.read<NavigationTodoCubitCubit>().selectedTodoItemChanged(item.id);

            if (!Breakpoints.mediumAndUp.isActive(context)) {
              context.push('/home/overview/${item.id.value}');
            }
          },
          child: Card(
            color: item.color.color,
            child: ListTile(
              title: Text(item.title),
            ),
          ),
        );
      },
    );
  }
}
