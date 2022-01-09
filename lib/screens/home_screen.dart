// ignore_for_file: prefer_const_constructors

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:mhm_website/screens/widgets/bottom_bar.dart';
import 'package:mhm_website/screens/widgets/carousal.dart';
import 'package:mhm_website/screens/widgets/destination_heading.dart';
import 'package:mhm_website/screens/widgets/explore_drawer.dart';
import 'package:mhm_website/screens/widgets/featured_heading.dart';
import 'package:mhm_website/screens/widgets/featured_tiles.dart';
import 'package:mhm_website/screens/widgets/introduction_text.dart';
import 'package:mhm_website/screens/widgets/top_bar_contents.dart';
import 'package:mhm_website/screens/widgets/web_scrollbar.dart';

import 'widgets/responsive.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.brightness_6),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    EasyDynamicTheme.of(context).changeTheme();
                  },
                ),
              ],
              title: Text(
                'EXPLORE',
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),
      drawer: ExploreDrawer(),
      body: WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: Colors.deepPurple,
                    child: SizedBox(
                      height: screenSize.height * 0.2,
                      width: screenSize.width,
                    ),
                  ),
                  Column(
                    children: [
                      // FloatingQuickAccessBar(screenSize: screenSize),
                      SizedBox(
                        height: 130,
                      ),
                      Container(
                        child: Column(
                          children: [
                            DestinationCarousel(),
                            SizedBox(
                              height: 200,
                            ),
                            IntroductionText(),
                            FeaturedHeading(
                              screenSize: screenSize,
                            ),
                            FeaturedTiles(screenSize: screenSize)
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              DestinationHeading(screenSize: screenSize),
              SizedBox(height: screenSize.height / 10),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
