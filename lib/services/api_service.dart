import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mhm_website/services/utils/app_url.dart';

List studentCountList = [];
Future getStudentCount() async {
  final response = await http.get(Uri.parse(AppUrl.studentCount));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
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
