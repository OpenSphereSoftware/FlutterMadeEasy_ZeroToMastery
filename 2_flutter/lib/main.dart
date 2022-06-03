import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme: const AppBarTheme(backgroundColor: Colors.amber)),
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter Basics")),
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Text("Hello World!", style: TextStyle(color: Colors.red, fontSize: 20)),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => debugPrint('clicked'),
          child: const Icon(Icons.ac_unit),
        ),
      ),
    );
  }
}
