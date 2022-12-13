import 'package:amazon_clone/constants/global_variables.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductImagesInput extends StatelessWidget {
  final VoidCallback selectProductImages;
  const AddProductImagesInput({super.key, required this.selectProductImages});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectProductImages,
      child: DottedBorder(
        //external package
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        dashPattern: const [10, 4],
        strokeCap: StrokeCap.round,
        strokeWidth: 2,
        child: Container(
          //dotted container
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //dotted container data
            children: [
              const Icon(Icons.folder_open, size: 40),
              const SizedBox(height: 10),
              Text('Select Product Images',
                  style: TextStyle(
                    fontSize: GlobalVariables.textSM,
                    color: Colors.grey.shade500,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
