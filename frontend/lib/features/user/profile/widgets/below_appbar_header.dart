import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBarHeader extends StatelessWidget {
  const BelowAppBarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      decoration: const BoxDecoration(gradient: GlobalVariables.appBarGradient),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: 'Hello, ',
                style: const TextStyle(
                  fontSize: GlobalVariables.textXL,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text:
                        "${(user.name)[0].toUpperCase()}${(user.name).substring(1).toLowerCase()}",
                    style: const TextStyle(
                      fontSize: GlobalVariables.textXL,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}