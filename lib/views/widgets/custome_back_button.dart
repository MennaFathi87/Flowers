import 'package:flowerss/views/home_view.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.ontap});
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffCF636C),
              borderRadius: BorderRadius.circular(32),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: Color(0xffFFD3DC), size: 28),
              onPressed: ontap ??
                  () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    }
                  },
            ),
          ),
        ),
      ),
    );
  }
}
