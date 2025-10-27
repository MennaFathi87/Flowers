import 'package:flutter/material.dart';

class CostumeFormTextFiled extends StatefulWidget {
  const CostumeFormTextFiled({
    super.key,
    required this.hintText,
    this.maxlines,
    this.onChanged,
    required this.controller,
    this.validator
  });

  final String hintText;
  final int? maxlines;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final String? Function(String?)? validator; 

  @override
  State<CostumeFormTextFiled> createState() => _CostumeFormTextFiledState();
}

class _CostumeFormTextFiledState extends State<CostumeFormTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: 251,
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.hintText == "Email"
              ? TextInputType.emailAddress
              : TextInputType.text,
            
          validator: widget.validator ??
              (val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter some text';
                }
                if (widget.hintText == "Email" &&
                    !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                        .hasMatch(val)) {
                  return 'Please entersome text';
                }
                return null;
              },
          onChanged: widget.onChanged,
          maxLines: widget.maxlines,
          decoration: InputDecoration(
            fillColor: const Color(0xffCF636C),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Color(0xffCF636C)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(84),
              borderSide: const BorderSide(
                color: Color(0xffCF636C),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(84),
              borderSide: const BorderSide(
                color: Color(0xffCF636C),
                width: 1,
              ),
            ),
          ),
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xffCF636C),
          ),
        ),
      ),
    );
  }
}
