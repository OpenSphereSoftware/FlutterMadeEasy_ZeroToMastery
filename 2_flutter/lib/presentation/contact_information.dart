import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: 80,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.redAccent.shade100,
            ),
            height: 160,
            width: 300,
          ),
        ),
        SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/max.jpeg'),
                radius: 80,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Max Steffen',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Flutter Freelancer & Co-Founder of tripmind',
                softWrap: true,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Column mit Circle, Name, Position
// Container dahinter der korrekt positioniert ist