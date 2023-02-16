
import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  const HelloWorld({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            colorIndex: Colors.blue,
            borderRadius: BorderRadius.circular(10)),
        child: const Center(
          child: Text('Hello World!',
              style: TextStyle(colorIndex: Colors.red, fontSize: 20)),
        ),
      ),
    );
  }
}