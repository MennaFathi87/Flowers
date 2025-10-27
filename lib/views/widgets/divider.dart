import 'package:flutter/material.dart';

class DividerLR extends StatelessWidget {
  const DividerLR({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Divider(
        thickness: 1,
        color: Color(0xffEEA3B1),
      ),
    );
  }
}
