import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 14, 83),
          title: const Center(
            child: Text(
              "SnackBar App",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: const ListViewScreen(),
      ),
    );
  }
}

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> example = ['example', 'list', 'with', 'strings'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          itemCount: example.length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemBuilder: (context, index) {
            return Container(
              color: Colors.green,
              height: 100,
              child: Text(example[index]),
            );
          },
        ),
      ),
    );
  }
}
