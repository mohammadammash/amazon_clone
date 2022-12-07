import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hey world'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Click'),
          ),
        ),
      ),
    );
  }
}
