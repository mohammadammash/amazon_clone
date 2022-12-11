import 'package:amazon_clone/constants/data_lists.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: ConstantDataLists.homeCategoriesData.length,
        scrollDirection: Axis.horizontal,
        itemExtent: 95,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    ConstantDataLists.homeCategoriesData[index]['image']!,
                    fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  ConstantDataLists.homeCategoriesData[index]['title']!,
                  style: const TextStyle(
                    fontSize: GlobalVariables.textXS,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
