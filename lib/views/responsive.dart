import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class IPhoneWrapper extends StatelessWidget {
  final Widget child;

  const IPhoneWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // نخلي عرض ثابت زي iPhone لو شغال على الويب
    double targetWidth = kIsWeb ? 390 : screenWidth;

    return Center(
      child: Container(
        width: targetWidth,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
