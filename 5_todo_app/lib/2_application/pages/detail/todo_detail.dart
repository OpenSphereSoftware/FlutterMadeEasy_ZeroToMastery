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
    final todo = todos.firstWhere((element) => element.id.value == id.value);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        todo.title,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.circle,
                      color: todo.color.color,
                    ),
                  ],
                ),
                Expanded(
                  child: Text(todo.body),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () => null,
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
