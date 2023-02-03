import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/2_application/pages/home/bloc/navigation_todo_cubit_cubit.dart';
import 'package:todo_app/2_application/pages/overview/widgets/add_collection_button.dart';

/// this class needs a provided NavigationTodoCubitCubit
class ToDoOverviewLoaded extends StatelessWidget {
  const ToDoOverviewLoaded({
    required this.collections,
    super.key,
  });

  final List<ToDoCollection> collections;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: collections.length,
          itemBuilder: (context, index) {
            final item = collections[index];
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
                  child: AddCollectionButton(
                    key: Key('add-todo-button'),
                  ),
                ),
              ),
      ],
    );
  }
}
