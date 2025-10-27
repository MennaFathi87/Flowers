import 'package:flutter/material.dart';

class opacityPhoto extends StatelessWidget {
  const opacityPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.6,
      child: Image.asset(
        'assets/photo/photo2.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
