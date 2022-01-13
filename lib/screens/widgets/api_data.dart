import 'dart:convert';

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mhm_website/screens/widgets/explore_drawer.dart';
import 'package:mhm_website/screens/widgets/responsive.dart';
import 'package:mhm_website/screens/widgets/top_bar_contents.dart';
import 'package:mhm_website/screens/widgets/web_scrollbar.dart';

class APIData extends StatefulWidget {
  @override
  State<APIData> createState() => _APIDataState();
}

class _APIDataState extends State<APIData> {
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

  // const APIData({Key? key}) : super(key: key);

  // Get Api data
  List<Photos> photosList = [];

  Future<List<Photos>> getPhotos() async {
    // final response = await http.get(Uri.parse("https://dashboard.deatrust.org/api/IOT/Hifzcount"));
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(title: i['title'], url: i['url']);
        photosList.add(photos);
      }
      return photosList;
    } else {
      return photosList;
    }
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
              title: Text("Madrasah Hasnain Moavia API DATA"))
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),
      drawer: ExploreDrawer(),
      body: WebScrollbar(
        color: Colors.grey,
        backgroundColor: Colors.blueGrey.withOpacity(0.4),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              color: Colors.deepPurple,
              child: SizedBox(
                height: screenSize.height * 0.2,
                width: screenSize.width,
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: getPhotos(),
                  builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: photosList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data![index].url.toString()),
                            ),
                            title: Text(
                              snapshot.data![index].title.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class Photos {
  String title;
  String url;

  Photos({required this.title, required this.url});
}
