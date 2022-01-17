import 'dart:convert';

import 'package:http/http.dart' as http;

List studentCountList = [];
Future getStudentCount() async {
  final response = await http
      .get(Uri.parse('https://dashboard.deatrust.org/api/IOT/SectionCount'));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    print(data);
    // for (Map i in data) {
    //   SectionCountModel countModel = SectionCountModel(
    //       nazraCount: i['nazraCount'],
    //       hifzCount: i['hifzCount'],
    //       qaidaCount: i['qaidaCount']);

    //   studentCountList.add(countModel);
    // }

    // return studentCountList;
    return data;
  } else {
    print("loading api");
    return data;
  }
}
