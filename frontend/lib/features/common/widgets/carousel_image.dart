import 'package:amazon_clone/constants/data_lists.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImage extends StatefulWidget {
  final List? data;
  const CarouselImage({super.key, this.data});

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.data != null
          ? widget.data?.map((item) {
              return Builder(
                builder: (BuildContext context) =>
                    Image.network(item, fit: BoxFit.cover, height: 200),
              );
            }).toList()
          : ConstantDataLists.carouselImages.map((item) {
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
