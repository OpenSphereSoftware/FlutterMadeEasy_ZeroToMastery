import 'package:flutter/material.dart';

class ToDoDetailLoading extends StatelessWidget {
  const ToDoDetailLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
