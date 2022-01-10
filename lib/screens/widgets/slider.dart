import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MySlider extends StatelessWidget {
  MySlider({Key? key}) : super(key: key);

  List<String> sliderImages = [
    "assets/images/slider-1.jpg",
    "assets/images/slider-2.jpg",
    "assets/images/slider-3.jpg",
    "assets/images/intro.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        onPageChanged: (position, reason) {
          print(reason);
          print(CarouselPageChangedReason.controller);
        },
        enableInfiniteScroll: false,
      ),
      items: sliderImages.map<Widget>((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(i))));
          },
        );
      }).toList(),
    );
  }
}
