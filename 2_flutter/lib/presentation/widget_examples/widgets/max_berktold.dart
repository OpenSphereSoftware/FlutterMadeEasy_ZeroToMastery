import 'package:flutter/material.dart';

class MaxBerktold extends StatelessWidget {
  const MaxBerktold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 100,
        height: 100,
        child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://static.wixstatic.com/media/e38214_2415b962d0244310bb630e9cb6ac7010~mv2.jpg/v1/fill/w_388,h_372,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/IMG_5274_edited_edited_edited_edited.jpg')));
  }
}
