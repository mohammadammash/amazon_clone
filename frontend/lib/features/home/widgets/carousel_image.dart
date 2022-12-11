import 'package:amazon_clone/constants/data_lists.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: ConstantDataLists.carouselImages.map((item) {
        return Builder(
          builder: (BuildContext context) =>
              Image.network(item, fit: BoxFit.cover, height: 200),
        );
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
      ),
    );
  }
}
