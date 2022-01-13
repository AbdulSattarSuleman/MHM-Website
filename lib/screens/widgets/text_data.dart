import 'package:flutter/material.dart';
import 'package:mhm_website/screens/widgets/student_count.dart';

class ResuableText extends StatelessWidget {
  ResuableText(
      {Key? key,
      required this.pageIndex,
      required this.snapshot,
      required this.studentCount})
      : super(key: key);
  final int pageIndex;
  // ignore: prefer_typing_uninitialized_variables
  final snapshot;
  List<String> studentCount;

  @override
  Widget build(BuildContext context) {
    return Text(
      categoryTitle[pageIndex] + snapshot.data[studentCount].toString(),
      style: TextStyle(
          fontSize: 16,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          color: Theme.of(context).primaryTextTheme.subtitle1!.color),
    );
  }
}
