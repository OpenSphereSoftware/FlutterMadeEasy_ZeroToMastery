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
        body: Container(
          color: Colors.pink,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Text(
                      'Max Steffen - Freelancer for flutter - living in germany',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
              Container(
                color: Colors.green,
                child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'First Column child',
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text("Hello World!", style: TextStyle(color: Colors.red, fontSize: 20)),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text('Last Column child'),
            ],
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
