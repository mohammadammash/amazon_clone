import 'package:amazon_clone/constants/routes_names.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    void navigateToPage(String routeName) {
      Navigator.pushNamed(context, routeName);
    }

    return Scaffold(
      body: const Center(
        child: Text('Products'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToPage(RoutesNames.addProductScreen);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
