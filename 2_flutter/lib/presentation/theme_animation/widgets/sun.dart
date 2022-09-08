import 'package:flutter/material.dart';
import 'package:flutterbasics/presentation/theme_animation/widgets/sun_shine.dart';

class Sun extends StatelessWidget {
  const Sun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SunShine(
      radius: 160,
      child: SunShine(
        radius: 120,
        child: SunShine(
          radius: 80,
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xDDFC554F),
                    Color(0xDDFFF79E),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                )),
          ),
        ),
      ),
    );
  }
}
