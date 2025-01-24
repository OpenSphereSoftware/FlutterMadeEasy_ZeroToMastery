import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: TextButton(
        child: const Text('Go To Screen One'),
        onPressed: () {
           Navigator.pushNamed(context, '/screenOne');
        },
      )),
    );
  }
}
