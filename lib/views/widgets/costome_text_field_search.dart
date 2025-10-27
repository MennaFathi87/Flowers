import 'package:flutter/material.dart';

class CostomeTextField extends StatelessWidget {
  const CostomeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 41,
      child: TextField(
        decoration: InputDecoration(
          iconColor: Color(0xffCF636C),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          suffixIcon: const Icon(
            Icons.camera_alt_outlined,
            color: Color(0xffCF636C),
          ),
          prefixIcon: const Icon(Icons.search, color: Color(0xffCF636C)),
          hintText: 'Search',
          hintStyle: const TextStyle(
            color: Color(0xffCF636C),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xffCF636C),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xffCF636C),
            ),
          ),
        ),
      ),
    );
  }
}
