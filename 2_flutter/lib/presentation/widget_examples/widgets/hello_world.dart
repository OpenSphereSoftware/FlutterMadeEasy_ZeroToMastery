
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
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)),
        child: const Center(
          child: Text('Hello World!',
              style: TextStyle(color: Colors.red, fontSize: 20)),
        ),
      ),
    );
  }
}