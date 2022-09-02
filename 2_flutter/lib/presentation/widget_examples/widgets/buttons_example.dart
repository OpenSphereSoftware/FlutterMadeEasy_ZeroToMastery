import 'package:flutter/material.dart';

class ButtonExamples extends StatefulWidget {
  const ButtonExamples({Key? key}) : super(key: key);

  @override
  State<ButtonExamples> createState() => _ButtonExamplesState();
}

class _ButtonExamplesState extends State<ButtonExamples> {
  bool switchState = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onLongPress: () {
              debugPrint('Long pressed');
            },
            onPressed: () {
              debugPrint('TextButton pressed');
            },
            child: Container(
                decoration: const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(8))),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Text Button',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ))),
        IconButton(
            onPressed: () {
              debugPrint('icon pressed');
            },
            icon: const Icon(Icons.play_arrow)),
        Switch(
            value: switchState,
            onChanged: (value) {
              switchState = value;
              setState(() {});
            })
      ],
    );
  }
}
