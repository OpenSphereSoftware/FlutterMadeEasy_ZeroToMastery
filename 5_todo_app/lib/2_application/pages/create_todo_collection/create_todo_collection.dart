import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/use_cases/add_todo_collection.dart';
import 'package:todo_app/2_application/core/page_route_config.dart';
import 'package:todo_app/2_application/pages/create_todo_collection/bloc/create_todo_collection_cubit.dart';

class CreateToDoCollectionProvider extends StatelessWidget {
  const CreateToDoCollectionProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateToDoCollectionCubit(
        addToDoCollection: AddToDoCollection(
          toDoRepository: RepositoryProvider.of(context),
        ),
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
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              validator: (titleValue) {
                if (titleValue == null || titleValue.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              onChanged: (titleValue) {
                context.read<CreateToDoCollectionCubit>().titleChanged(titleValue);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Color',
              ),
              keyboardType: TextInputType.number,
              onChanged: (colorValue) {
                context.read<CreateToDoCollectionCubit>().colorChanged(colorValue);
              },
              validator: (colorValue) {
                if (colorValue != null && colorValue.isNotEmpty) {
                  final color = int.tryParse(colorValue);
                  if (color == null || color < 0 || color > ToDoColor.predefinedColors.length - 1) {
                    return 'Only numbers between 0 and ${ToDoColor.predefinedColors.length - 1} are allowed are allowed';
                  }
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final isValid = _formKey.currentState?.validate();
                if (isValid == true) {
                  context.read<CreateToDoCollectionCubit>().submit();
                  context.pop();
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
