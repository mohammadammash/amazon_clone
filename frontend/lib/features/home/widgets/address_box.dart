import 'package:flutter/material.dart';

class AddressBox extends StatelessWidget {
  final String currentUserName;
  final String currentUserAddress;

  const AddressBox({
    super.key,
    required this.currentUserName,
    required this.currentUserAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 114, 226, 221),
            Color.fromARGB(255, 162, 236, 233),
          ],
        ),
      ),
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            size: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'Delivery to $currentUserName - $currentUserAddress',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                //to hide the text and show 3 point if cannot be expanded more because no more space available
              ),
            ),
          )
        ],
      ),
    );
  }
}
