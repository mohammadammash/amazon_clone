import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/common/widgets/app_bar.dart';
import 'package:amazon_clone/features/common/widgets/text_input.dart';
import 'package:amazon_clone/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  Authentication authentication = Authentication();

  final _addressFormKey = GlobalKey<FormState>();
  final TextEditingController _flatBuildingController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _flatBuildingController.dispose();
    _areaController.dispose();
    _pincodeController.dispose();
    _cityController.dispose();
  }

  List<PaymentItem> paymentItems = [
    const PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];

  void handleConfirmPayment(paymentResult) {
    debugPrint('-------------');
    debugPrint(paymentResult);
    debugPrint('-------------');
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
                  GooglePayButton(
                    paymentConfigurationAsset:
                        'google_pay.json', //whole location added in pubsec.yaml
                    paymentItems: paymentItems,
                    type: GooglePayButtonType.pay,
                    onPaymentResult: handleConfirmPayment,
                    loadingIndicator: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    margin: const EdgeInsets.only(top: 15.0),
                    height: 50,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
