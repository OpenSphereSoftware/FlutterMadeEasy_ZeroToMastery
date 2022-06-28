import 'package:flutter/material.dart';

class ButtonExamples extends StatelessWidget {
  const ButtonExamples({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onLongPress: () {
              print("Long pressed");
            },
            onPressed: () {
              print("TextButton pressed");
            },
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Text Button",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ))),
        IconButton(
            onPressed: () {
              print("icon pressed");
            },
            icon: const Icon(Icons.play_arrow)),
        Switch(
            value: true,
            onChanged: (value) {
              print(value);
            })
      ],
    );
  }
}
