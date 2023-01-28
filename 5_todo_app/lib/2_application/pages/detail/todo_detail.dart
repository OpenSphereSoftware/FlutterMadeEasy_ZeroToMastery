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

    return Container(
      width: double.infinity,
      color: todo.color.color,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(todo.title),
          Text(todo.body),
        ],
      ),
    );
  }
}
