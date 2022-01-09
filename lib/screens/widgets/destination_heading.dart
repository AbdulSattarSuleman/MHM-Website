import 'package:flutter/material.dart';

import 'responsive.dart';

class DestinationHeading extends StatelessWidget {
  const DestinationHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Container(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            width: screenSize.width,
            // color: Colors.black,
            child: Text(
              'Introduction'.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.only(
              top: screenSize.height / 10,
              bottom: screenSize.height / 15,
            ),
            width: screenSize.width,
            // color: Colors.black,
            child: const Text(
              'Introduction',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
