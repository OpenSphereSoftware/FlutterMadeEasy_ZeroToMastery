import 'package:flutter/material.dart';

class MaxSteffen extends StatelessWidget {
  const MaxSteffen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              'assets/max.jpeg',
              fit: BoxFit.cover,
            )),
        const Positioned(
          top: 80,
          left: 20,
          child: Text('Max Steffen'),
        ),
      ],
    );
  }
}
