// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/features/common/widgets/button.dart';
import 'package:amazon_clone/features/user/cart/services/cart_services.dart';
import 'package:amazon_clone/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/common/widgets/app_bar.dart';
import 'package:amazon_clone/features/common/widgets/text_input.dart';
import 'package:amazon_clone/utils/authentication.dart';

class AddressScreen extends StatefulWidget {
  final String totalAmount;
  const AddressScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  Authentication authentication = Authentication();
  final CartServices cartServices = CartServices();

  final _addressFormKey = GlobalKey<FormState>();
  final TextEditingController _flatBuildingController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  List<PaymentItem> paymentItems = [];
  @override
  void initState() {
    super.initState();
    paymentItems.add(
      PaymentItem(
          amount: widget.totalAmount,
          label: 'Total Amount',
          status: PaymentItemStatus.final_price),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _flatBuildingController.dispose();
    _areaController.dispose();
    _pincodeController.dispose();
    _cityController.dispose();
  }

  void handleSubmitAddress(String currentUserAddress) async {
    String addressToBeUsed = '';
    //already found address
    if (currentUserAddress.isNotEmpty) {
      addressToBeUsed = currentUserAddress;
    }
    //access form address
    else {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            '${_flatBuildingController.text}, ${_areaController.text}, ${_pincodeController.text} - ${_cityController.text}';
      } else {
        showSnackBar(context, 'Please fill Address Data!!');
        return;
      }
    }

    await cartServices.postSaveNewAddress(
        context: context, newAddress: addressToBeUsed);
    await cartServices.postSubmitOrder(
        context: context, totalAmount: int.parse(widget.totalAmount));
  }

  @override
  Widget build(BuildContext context) {
    final currentUserAddress =
        authentication.getCurrentUser(context: context).address;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
            currentUserType: GlobalVariables.adminUserType, title: 'Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            if (currentUserAddress.isNotEmpty)
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(currentUserAddress,
                          style: const TextStyle(
                            fontSize: GlobalVariables.textMD,
                          )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('OR',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                ],
              ),
            Form(
              key: _addressFormKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _flatBuildingController,
                    textPlaceholder: 'Flat, House Nb, Building',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _areaController,
                    textPlaceholder: 'Area, Street',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _pincodeController,
                    textPlaceholder: 'Pincode',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _cityController,
                    textPlaceholder: 'Town/City',
                  ),
                  const SizedBox(height: 10),
                  //
                  CustomButton(
                    text: 'Submit',
                    handlePress: () => handleSubmitAddress(currentUserAddress),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
