import 'package:flutter/material.dart';

class costumePassword extends StatelessWidget {
  const costumePassword({super.key, required this.pass});
  final String pass;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xffEEA3B1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Center(child: Text(pass)),
    );
  }
}
