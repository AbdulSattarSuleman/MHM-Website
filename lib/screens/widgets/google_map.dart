import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyGoogleMap extends StatefulWidget {
  const MyGoogleMap({Key? key}) : super(key: key);

  @override
  _MyGoogleMapState createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(24.85871191612547, 67.0038782779756);
  late WebViewController controller;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final mapIframe = """
    <div style="width: 100%"><iframe width="100%" height="600" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=Nishtar%20Rd,%20Bhimpura,%20Karachi,%20Karachi%20City,%20Sindh+(Madarsa%20Hasnain%20Moavia)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe></p>
    """;

  final htmlContent = '''
    <h2> Tag Test </h2>
    <iframe src="https://www.w3schools.com" title="W3Schools Free Online Web Tutorials"></iframe>
    ''';

  void loadGoogleMap() async {
    final html = await rootBundle.loadString('assets/map.html');
    final url = Uri.dataFromString(html,
            mimeType: "text/html", encoding: Encoding.getByName('utf-8'))
        .toString();
    controller.loadUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      // margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: screenSize.width,
      height: 400,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
      ),
    );
    // return SizedBox(
    //   width: screenSize.width,
    //   height: 400,
    //   child: Html(
    //     data: mapIframe,
    //     style: {'h1': Style(color: Colors.deepPurple)},
    //   ),
    // );
    // return WebView(
    //   zoomEnabled: true,
    //   javascriptMode: JavascriptMode.unrestricted,
    //   // initialUrl: "deatrust.org",
    //   onWebViewCreated: (controller) {
    //     this.controller = controller;

    //     loadGoogleMap();
    //   },
    // );
  }
}
