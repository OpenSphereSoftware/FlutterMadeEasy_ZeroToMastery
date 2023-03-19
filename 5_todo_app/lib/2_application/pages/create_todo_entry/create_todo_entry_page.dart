import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';
import 'package:todo_app/1_domain/use_cases/create_todo_entry.dart';
import 'package:todo_app/2_application/core/form_value.dart';
import 'package:todo_app/2_application/core/page_config.dart';
import 'package:todo_app/2_application/pages/create_todo_entry/bloc/create_todo_entry_page_cubit.dart';

typedef ToDoEntryItemAddedCallback = Function();

class CreateToDoEntryPageExtra {
  final CollectionId collectionId;
  final ToDoEntryItemAddedCallback toDoEntryItemAddedCallback;

  CreateToDoEntryPageExtra({
    required this.collectionId,
    required this.toDoEntryItemAddedCallback,
  });
}

class CreateToDoEntryPageProvider extends StatelessWidget {
  const CreateToDoEntryPageProvider({
    super.key,
    required this.collectionId,
    required this.toDoEntryItemAddedCallback,
  });

  final CollectionId collectionId;
  final ToDoEntryItemAddedCallback toDoEntryItemAddedCallback;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateToDoEntryPageCubit>(
      create: (context) => CreateToDoEntryPageCubit(
        collectionId: collectionId,
        addToDoEntry: CreateToDoEntry(
          toDoRepository: RepositoryProvider.of<ToDoRepository>(context),
        ),
      ),
      child: CreateToDoEntryPage(
        toDoEntryItemAddedCallback: toDoEntryItemAddedCallback,
      ),
    );
  }
}

class CreateToDoEntryPage extends StatefulWidget {
  const CreateToDoEntryPage({
    super.key,
    required this.toDoEntryItemAddedCallback,
  });

  final ToDoEntryItemAddedCallback toDoEntryItemAddedCallback;

  static const pageConfig = PageConfig(
    name: 'create_todo_entry',
    icon: Icons.add_task_rounded,
    child: Placeholder(),
  );

  @override
  State<CreateToDoEntryPage> createState() => _CreateToDoEntryPageState();
}

class _CreateToDoEntryPageState extends State<CreateToDoEntryPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'description'),
              validator: (value) {
                final currentValidationState =
                    context.read<CreateToDoEntryPageCubit>().state.description?.validationStatus ??
                        ValidationStatus.pending;
                switch (currentValidationState) {
                  case ValidationStatus.error:
                    return 'This field needs at least two characters to be valid';
                  case ValidationStatus.success:
                  case ValidationStatus.pending:
                    return null;
                }
              },
              onChanged: (value) {
                context.read<CreateToDoEntryPageCubit>().descriptionChanged(description: value);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                final isValid = _formKey.currentState?.validate();
                if (isValid == true) {
                  context.read<CreateToDoEntryPageCubit>().submit();
                  widget.toDoEntryItemAddedCallback.call();
                  context.pop();
                }
              },
              child: const Text('Save entry'),
            ),
          ],
        ),
      ),
    );
  }
}
