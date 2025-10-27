import 'package:flutter/material.dart';

class CustomFaveButton extends StatelessWidget {
  const CustomFaveButton({super.key, this.ontap});
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffCF636C),
        borderRadius: BorderRadius.circular(32),
      ),
      child: IconButton(
        icon: const Icon(Icons.favorite, color: Color(0xffFFD3DC), size: 28),
        onPressed: ontap ?? () {}, // هنا ممكن تضيفي وظيفة المفضلة بعدين
      ),
    );
  }
}
