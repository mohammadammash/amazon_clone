import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/common/widgets/loading_indicator.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  final Product? product;
  const DealOfDay({super.key, required this.product});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return widget.product == null
        ? const CustomLoadingIndicator()
        : widget.product!.name.isEmpty
            ? const SizedBox()
            : Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: const Text(
                      'Deal of the day',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  //-------------------
                  //MAIN IMAGE AND INFO
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.network(
                      widget.product!.images[0],
                      height: 235,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\$${widget.product!.price} TTC',
                      style: const TextStyle(
                        fontSize: GlobalVariables.textMD,
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 5,
                        right: 40,
                      ),
                      child: Text(widget.product!.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: GlobalVariables.textLG,
                            fontWeight: FontWeight.bold,
                          ))),
                  const SizedBox(height: 15),

                  //------------------------------
                  //RELATED IMAGES
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: widget.product!.images
                          .map((e) => Image.network(
                                e,
                                fit: BoxFit.fitWidth,
                                width: 100,
                                height: 100,
                              ))
                          .toList(),
                    ),
                  ),

                  //-----------------------
                  //SEE ALL DEALS TEXT
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ).copyWith(left: 15),
                    child: Text(
                      'See all deals',
                      style: TextStyle(
                        color: Colors.cyan[800],
                      ),
                    ),
                  ),
                ],
              );
  }
}
