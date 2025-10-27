import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({super.key, required this.title, this.onTap});
  final String title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffCF636C),
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
      onPressed: onTap,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18, color: Colors.white, fontFamily: 'pizzola'),
      ),
    );
  }
}
