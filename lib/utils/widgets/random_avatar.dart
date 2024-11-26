import 'dart:math';

import 'package:flutter/material.dart';

class RandomAvatar extends StatelessWidget {
  const RandomAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(_getRandomImagePath());
  }

  String _getRandomImagePath() {
    String image = <String>[
      'person1.png',
      'person2.png',
      'person3.png',
      'person4.png',
      'person5.png',
    ][Random().nextInt(5)];
    return 'assets/images/$image';
  }
}
