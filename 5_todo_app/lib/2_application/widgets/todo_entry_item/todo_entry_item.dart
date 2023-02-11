import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/use_cases/load_todo_entry.dart';
import 'package:todo_app/1_domain/use_cases/update_todo_entry.dart';
import 'package:todo_app/2_application/widgets/todo_entry_item/bloc/todo_entry_item_cubit.dart';
import 'package:todo_app/2_application/widgets/todo_entry_item/view_states/todo_entry_item_error.dart';
import 'package:todo_app/2_application/widgets/todo_entry_item/view_states/todo_entry_item_loaded.dart';
import 'package:todo_app/2_application/widgets/todo_entry_item/view_states/todo_entry_item_loading.dart';

class ToDoEntryItemProvider extends StatelessWidget {
  const ToDoEntryItemProvider({
    super.key,
    required this.entryId,
    required this.collectionId,
  });

  final EntryId entryId;
  final CollectionId collectionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoEntryItemCubit(
        entryId: entryId,
        collectionId: collectionId,
        updateToDoEntry: UpdateToDoEntry(
          toDoRepository: RepositoryProvider.of(context),
        ),
        loadToDoEntry: LoadToDoEntry(
          toDoRepository: RepositoryProvider.of(context),
        ),
      )..fetchToDoEntry(),
      child: ToDoEntryItem(
        entryId: entryId,
      ),
    );
  }
}

class ToDoEntryItem extends StatelessWidget {
  const ToDoEntryItem({
    super.key,
    required this.entryId,
  });

  final UniqueID entryId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoEntryItemCubit, ToDoEntryItemState>(
      builder: (context, state) {
        if (state is ToDoEntryItemLoadingState) {
          return const ToDoEntryItemLoading();
        } else if (state is ToDoEntryItemLoadedState) {
          return ToDoEntryItemLoaded(
            onChanged: (value) {
              context.read<ToDoEntryItemCubit>().updateStateOfEntry();
            },
            entry: state.toDoEntry,
          );
        }
        return const ToDoEntryItemError();
      },
    );
  }
}
