import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/2_application/core/page_route_config.dart';
import 'package:todo_app/2_application/pages/create_todo_entry/bloc/create_todo_entry_cubit.dart';

class CreateToDoEntryProvider extends StatelessWidget {
  const CreateToDoEntryProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateToDoEntryCubit(
        addToDoEntry: RepositoryProvider.of(context),
      ),
      child: const CreateToDoEntry(),
    );
  }
}

class CreateToDoEntry extends StatefulWidget {
  const CreateToDoEntry({super.key});

  @override
  State<CreateToDoEntry> createState() => _CreateToDoEntryState();

  static const page = PageRouteConfig(
    key: 'add_todo_collection',
    icon: Icons.add_task_rounded,
    child: CreateToDoEntryProvider(),
  );
}

class _CreateToDoEntryState extends State<CreateToDoEntry> {
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
              validator: (titleValue) {
                if (titleValue == null || titleValue.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              onChanged: (titleValue) {
                context.read<CreateToDoEntryCubit>().titleChanged(titleValue);
              },
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextFormField(
              onChanged: (colorValue) {
                context.read<CreateToDoEntryCubit>().colorChanged(colorValue);
              },
              decoration: const InputDecoration(
                labelText: 'Color',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final isValid = _formKey.currentState?.validate();
                if (isValid == true) {
                  context.read<CreateToDoEntryCubit>().submit();
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
