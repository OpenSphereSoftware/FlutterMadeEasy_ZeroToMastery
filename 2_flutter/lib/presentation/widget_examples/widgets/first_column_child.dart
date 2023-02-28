import 'package:flutter/material.dart';

class FirstColumnChild extends StatelessWidget {
  const FirstColumnChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'First Column child',
          )),
    );
  }
}
