import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/2_application/core/page_route_config.dart';
import 'package:todo_app/2_application/pages/create_todo_collection/bloc/create_todo_collection_cubit.dart';

class CreateToDoCollectionProvider extends StatelessWidget {
  const CreateToDoCollectionProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateToDoCollectionCubit(
        addToDoCollection: RepositoryProvider.of(context),
      ),
      child: const CreateToDoCollection(),
    );
  }
}

class CreateToDoCollection extends StatefulWidget {
  const CreateToDoCollection({super.key});

  @override
  State<CreateToDoCollection> createState() => _CreateToDoCollectionState();

  static const page = PageRouteConfig(
    key: 'add_todo_collection',
    icon: Icons.add_task_rounded,
    child: CreateToDoCollectionProvider(),
  );
}

class _CreateToDoCollectionState extends State<CreateToDoCollection> {
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
                context.read<CreateToDoCollectionCubit>().titleChanged(titleValue);
              },
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextFormField(
              onChanged: (colorValue) {
                context.read<CreateToDoCollectionCubit>().colorChanged(colorValue);
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
                  context.read<CreateToDoCollectionCubit>().submit();
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
