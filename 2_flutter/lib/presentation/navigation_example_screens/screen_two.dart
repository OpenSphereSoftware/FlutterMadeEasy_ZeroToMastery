import 'package:flutter/material.dart';
import 'package:flutterbasics/presentation/navigation_example_screens/screen_one.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

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
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => const ScreenOne())));
        },
      )),
    );
  }
}
