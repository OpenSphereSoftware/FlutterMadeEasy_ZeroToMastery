import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen One'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: TextButton(
        child: const Text('Go Back'),
        onPressed: () {
          Navigator.popUntil(context, (route) => route.isFirst);
        },
      )),
    );
  }
}
