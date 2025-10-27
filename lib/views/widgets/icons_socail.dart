import 'package:flutter/material.dart';

class iconsSocail extends StatelessWidget {
  const iconsSocail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/photo/Vector.png'),
        const SizedBox(width: 20),
        Image.asset('assets/photo/devicon_google.png'),
        const SizedBox(width: 20),
        Image.asset('assets/photo/devicon_apple.png'),
      ],
    );
  }
}
