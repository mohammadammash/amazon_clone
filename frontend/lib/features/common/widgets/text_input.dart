import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  //params
  final TextEditingController controller;
  final String textPlaceholder;
  final int maxLines;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.textPlaceholder,
    this.maxLines =
        1, //default value instead of adding it as optional conditionally, so for normal input maxLines = 1
  });

  @override
  Widget build(BuildContext context) {
    //TextFormField instead of TextForm to use validator arg
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: (val) {
        if (val == null || val.isEmpty) return 'Enter your $textPlaceholder';
        return null; //null => no errors
      },
      decoration: InputDecoration(
        hintText: textPlaceholder,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}
