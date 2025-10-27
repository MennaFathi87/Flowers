import 'package:flutter/material.dart';

class NavigateLogin extends StatelessWidget {
  NavigateLogin({super.key, required this.txt, this.onTap});
  final String txt;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have account? ",
          style: TextStyle(color: Color(0xffEEA3B1)),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            txt,
            style: TextStyle(
                color: Color(0xffCF636C),
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Color(0xffCF636C),
                fontFamily: 'pizzola'),
          ),
        ),
      ],
    );
  }
}
