import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mhm_website/screens/widgets/responsive.dart';

class DestinationCarousel extends StatefulWidget {
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final String imagePath = 'assets/images/';

  final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  final List<String> images = [
    'assets/images/slider-1.jpg',
    'assets/images/slider-2.jpg',
    'assets/images/slider-3.jpg',
  ];

  final List<String> places = [
    'LATEST BLOG',
    'LATEST NEWS',
    'LATEST ARTICLES',
    'LATEST EVENTS',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return CarouselSlider(
      items: imageSliders,
      options: CarouselOptions(
          pageSnapping: true,
          enableInfiniteScroll: true,
          scrollPhysics: ResponsiveWidget.isSmallScreen(context)
              ? PageScrollPhysics()
              : NeverScrollableScrollPhysics(),
          enlargeCenterPage: true,
          aspectRatio: 18 / 8,
          autoPlay: true,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
              for (int i = 0; i < imageSliders.length; i++) {
                if (i == index) {
                  _isSelected[i] = true;
                } else {
                  _isSelected[i] = false;
                }
              }
            });
          }),
      carouselController: _controller,
    );
  }
}
