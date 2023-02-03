import 'package:flutter/material.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/2_application/core/page_route_config.dart';
import 'package:todo_app/main.dart';

class TodoDetail extends StatelessWidget {
  const TodoDetail({
    super.key,
    required this.id,
  });

  static const pageConfig = PageRouteConfig(
    key: 'dashboard',
    icon: Icons.dashboard_rounded,
    child: Text('dashboard'),
  );

  final UniqueID id;

  @override
  Widget build(BuildContext context) {
    // TODO(Max): load correct todo here

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: todo.length,
              itemBuilder: (context, index) {
                // TODO load all entries here
                final todoDetail = todo[index];

                return CheckboxListTile(
                  title: Text(todoDetail.description),
                  value: todoDetail.isDone,
                  onChanged: (value) => debugPrint('${todoDetail.id}'),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () => debugPrint('add entry'),
                child: const Icon(
                  Icons.edit,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
