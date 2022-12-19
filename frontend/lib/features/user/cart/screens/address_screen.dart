import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/common/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
            currentUserType: GlobalVariables.adminUserType, title: 'Address'),
      ),
    );
  }
}
