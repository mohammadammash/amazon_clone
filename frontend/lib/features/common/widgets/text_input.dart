import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  //params
  final TextEditingController controller;
  final String textPlaceholder;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.textPlaceholder,
  });

  @override
  Widget build(BuildContext context) {
    //TextFormField instead of TextForm to use validator arg
    return TextFormField(
      controller: controller,
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
