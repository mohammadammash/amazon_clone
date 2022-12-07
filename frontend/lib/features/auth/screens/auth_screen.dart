import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              Text('Welcome',
                  style: TextStyle(
                    fontSize: GlobalVariables.textXL,
                    fontWeight: FontWeight.w500,
                  )),
              ListTile(
              )
            ],
          ),
        ),
      ),
    );
  }
}
