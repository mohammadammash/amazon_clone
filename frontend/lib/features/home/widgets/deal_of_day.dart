import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            'https://images.unsplash.com/photo-1661961110671-77b71b929d52?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxzZWFyY2h8MTV8fGxhcHRvcHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            height: 235,
            fit: BoxFit.fitHeight,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          alignment: Alignment.topLeft,
          child: const Text(
            '\$170',
            style: TextStyle(
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
            child: const Text(
              'Rivaan',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )),
        const SizedBox(height: 15),

        //------------------------------
        //RELATED IMAGES
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                  'https://images.unsplash.com/photo-1515343480029-43cdfe6b6aae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzd8fGxhcHRvcHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                  fit: BoxFit.fitWidth,
                  height: 100),
              Image.network(
                  'https://images.unsplash.com/photo-1543652437-15ae836b33e3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fGxhcHRvcHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                  fit: BoxFit.fitWidth,
                  height: 100),
              Image.network(
                  'https://images.unsplash.com/photo-1511385348-a52b4a160dc2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDR8fGxhcHRvcHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                  fit: BoxFit.fitWidth,
                  height: 100),
              Image.network(
                  'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-   4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDZ8fGxhcHRvcHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                  fit: BoxFit.fitWidth,
                  height: 100),
            ],
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
