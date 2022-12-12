import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String currentUserType;
  final String? title;
  const CustomAppBar({super.key, required this.currentUserType, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: GlobalVariables.appBarGradient,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentUserType != GlobalVariables.adminUserType)
            Expanded(
              child: Container(
                height: 42,
                margin: const EdgeInsets.only(left: 15),
                child: Material(
                  borderRadius: BorderRadius.circular(7),
                  elevation: 1,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.only(
                            left: 6,
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 23,
                          ),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(top: 10),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black38,
                          width: 1,
                        ),
                      ),
                      hintText: 'Search Amazon.in',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            )
          else
            Image.asset(
              'lib/assets/images/amazon_in.png',
              width: 120,
              height: 50,
              color: Colors.black,
            ),
          if (currentUserType != GlobalVariables.adminUserType)
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.notifications_outlined),
                  ),
                  Icon(
                    Icons.search,
                  ),
                ],
              ),
            )
          else
            Text(
              title == null ? 'Admin' : title!,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
        ],
      ),
    );
  }
}
