import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback handlePress;

  const CustomButton({
    super.key,
    required this.text,
    required this.handlePress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: handlePress,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(
            double.infinity,
            50,
          ),
        ),
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: GlobalVariables.textLG,
          ),
        ));
  }
}
