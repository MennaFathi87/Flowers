import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  CustomeButton({this.onTap, required this.text});
  VoidCallback? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffCF636C),
          borderRadius: BorderRadius.circular(25),
        ),
        width: 278,
        height: 50,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
