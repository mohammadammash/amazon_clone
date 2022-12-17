import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback handlePress;
  final String? colorType;

  const CustomButton(
      {super.key,
      required this.text,
      required this.handlePress,
      this.colorType});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: handlePress,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              colorType == null ? GlobalVariables.secondaryColor : Colors.teal,
          minimumSize: const Size(
            double.infinity,
            50,
          ),
        ),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: GlobalVariables.textLG,
            color: colorType == null ? Colors.white : Colors.black,
          ),
        ));
  }
}
