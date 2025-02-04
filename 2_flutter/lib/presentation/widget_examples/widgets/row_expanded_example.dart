import 'package:flutter/material.dart';

class RowEpandedExample extends StatelessWidget {
  const RowEpandedExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
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
        Container(
          height: 20,
          width: 20,
          color: Colors.green,
        ),
      ],
    );
  }
}
