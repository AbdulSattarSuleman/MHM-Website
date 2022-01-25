import 'dart:math';

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mhm_website/screens/widgets/bottom_bar.dart';
import 'package:mhm_website/screens/widgets/destination_heading.dart';
import 'package:mhm_website/screens/widgets/explore_drawer.dart';
import 'package:mhm_website/screens/widgets/responsive.dart';
import 'package:mhm_website/screens/widgets/top_bar_contents.dart';

class PrayerDuaScreen extends StatelessWidget {
  PrayerDuaScreen({Key? key}) : super(key: key);
  List<String> duaImages = [
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/20190415_120042-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/20190415_120024-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/IMG-20190722-WA0084-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/Screenshot_20190724-100826_Hifazat%20Ki%20Dua-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/Screenshot_20190617-125209_YouTube-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/Screenshot_20190724-100819_Hifazat%20Ki%20Dua-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/20190415_120004-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/20190415_120058-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/image_c165f2c7-adc3-49b7-be4d-0dfc7b8b161-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/8d4ef974b7e81238bf141fa0b766f190--dua-for-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/IMG-20190721-WA0060-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/image_c99c4ce7-6e15-4d22-b1a6-0dc192fa5cd-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/IMG-20190722-WA0009-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/image_4ce6c824-0836-46ed-a621-c57102a4a65-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/Screenshot_20181018-154137_Gallery-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/FB_IMG_1466801723665-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/IMG-20190722-WA0004-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/IMG-20190722-WA0012-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/image_895aa464-6c3f-43d3-b384-a470c446d68-0001.jpg/:/rs=w:370,cg:true,m',
    'https://img1.wsimg.com/isteam/ip/4eb57113-5b02-4def-bab1-b5bdeffd46e9/maxresdefault-0001.jpg/:/rs=w:370,cg:true,m',
  ];

  final List<Map<String, dynamic>> _items = List.generate(
      200,
      (index) => {
            "id": index,
            "title": "Item $index",
          });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                backgroundColor: Theme.of(context).bottomAppBarColor,
                elevation: 0,
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.brightness_6),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      EasyDynamicTheme.of(context).changeTheme();
                    },
                  ),
                ],
                title: const Text("Madrasah Hasnain Moavia"))
            : PreferredSize(
                preferredSize: Size(screenSize.width, 1000),
                child: TopBarContents(1),
              ),
        drawer: ExploreDrawer(),
        body: SafeArea(
          child: ResponsiveWidget.isSmallScreen(context)
              ? ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DestinationHeading(
                          screenSize: screenSize,
                          title: "Prayers For Daily Recitation"),
                    ),
                    Expanded(
                      flex: 1,
                      child: MasonryGridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: duaImages.length,
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 30),
                          // Number of Columns
                          crossAxisCount: 1,

                          // vertical gap between to items
                          mainAxisSpacing: 3,

                          // Horizontal Gap between two items
                          crossAxisSpacing: 0,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        content:
                                            Image.network(duaImages[index]),
                                      );
                                    });
                              },
                              child: Card(
                                color: Color.fromARGB(
                                  Random().nextInt(256),
                                  Random().nextInt(256),
                                  Random().nextInt(256),
                                  Random().nextInt(256),
                                ),
                                child: SizedBox(
                                  height: _items[index][100],
                                  child: Center(
                                    child: Image.network(
                                      duaImages[index],
                                      fit: BoxFit.fitWidth,
                                      filterQuality: FilterQuality.high,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    BottomBar(),
                  ],
                )
              : ListView(
                  children: [
                    DestinationHeading(
                        screenSize: screenSize,
                        title: "Prayers For Daily Recitation"),
                    Expanded(
                      flex: 1,
                      child: MasonryGridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: duaImages.length,
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 30),
                          // Number of Columns
                          crossAxisCount: 3,

                          // vertical gap between to items
                          mainAxisSpacing: 4,

                          // Horizontal Gap between two items
                          crossAxisSpacing: 0,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        // elevation: 4.0,
                                        // backgroundColor: Colors.transparent,
                                        content: Image.network(
                                          duaImages[index],
                                          filterQuality: FilterQuality.high,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      );
                                    });
                              },
                              child: Card(
                                color: Color.fromARGB(
                                  Random().nextInt(256),
                                  Random().nextInt(256),
                                  Random().nextInt(256),
                                  Random().nextInt(256),
                                ),
                                child: SizedBox(
                                  height: _items[index][100],
                                  child: Center(
                                    child: Image.network(
                                      duaImages[index],
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    BottomBar()
                  ],
                ),
        ));
  }
}
