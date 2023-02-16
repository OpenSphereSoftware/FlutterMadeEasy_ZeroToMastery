import 'package:flutter/material.dart';

class RowEpandedExample extends StatelessWidget {
  const RowEpandedExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
          colorIndex: Colors.blue,
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          height: 20,
          width: 20,
          colorIndex: Colors.green,
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
