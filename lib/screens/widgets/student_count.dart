import 'package:flutter/material.dart';
import 'package:mhm_website/screens/widgets/responsive.dart';
import 'package:mhm_website/services/api_service.dart';

final List<String> sliderImages = [
  'assets/images/hifz.jpg',
  'assets/images/nazra.jpg',
  'assets/images/qaida.jpg',
];

final List<String> categoryTitle = [
  'HIFZ E QURAN STUDENTS',
  'NAZRA QURAN STUDENTS',
  'QAIDA STUDENTS',
];

class StudentCountScreen extends StatelessWidget {
  final Size screenSize;
  StudentCountScreen({Key? key, required this.screenSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getStudentCount(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ResponsiveWidget.isSmallScreen(context)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: screenSize.width / 15,
                            ),
                            ...Iterable<int>.generate(sliderImages.length).map(
                              (int pageIndex) => Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: screenSize.width / 2.5,
                                        width: screenSize.width,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.asset(
                                            sliderImages[pageIndex],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                            top: screenSize.height / 70,
                                            bottom: screenSize.height / 70,
                                          ),
                                          child: pageIndex == 0
                                              // ? Text(
                                              //     categoryTitle[pageIndex] +
                                              //         snapshot
                                              //             .data['nazraCount']
                                              //             .toString(),
                                              //     style: TextStyle(
                                              //         fontSize: 16,
                                              //         fontFamily: 'Montserrat',
                                              //         fontWeight:
                                              //             FontWeight.w900,
                                              //         color: Theme.of(context)
                                              //             .primaryTextTheme
                                              //             .subtitle1!
                                              //             .color),
                                              //   )
                                              ? Center(
                                                  child: Text(
                                                    categoryTitle[pageIndex] +
                                                        ' ${snapshot.data['nazraCount'].toString()}',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Theme.of(context)
                                                            .primaryTextTheme
                                                            .subtitle1!
                                                            .color),
                                                  ),
                                                )
                                              : pageIndex == 1
                                                  ? Center(
                                                      child: Text(
                                                        categoryTitle[
                                                                pageIndex] +
                                                            ' ${snapshot.data['hifzCount'].toString()}',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryTextTheme
                                                                .subtitle1!
                                                                .color),
                                                      ),
                                                    )
                                                  : Center(
                                                      child: Text(
                                                        categoryTitle[
                                                                pageIndex] +
                                                            ' ${snapshot.data['qaidaCount'].toString()}',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryTextTheme
                                                                .subtitle1!
                                                                .color),
                                                      ),
                                                    ))
                                    ],
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   width: screenSize.width / 15,
                              // ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.06,
                      left: screenSize.width / 15,
                      right: screenSize.width / 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...Iterable<int>.generate(sliderImages.length).map(
                          (int pageIndex) => Column(
                            children: [
                              SizedBox(
                                height: screenSize.width / 6,
                                width: screenSize.width / 3.8,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.asset(
                                    sliderImages[pageIndex],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: screenSize.height / 70,
                                ),
                                child: pageIndex == 0
                                    // ? ResuableText(
                                    //     pageIndex: pageIndex,
                                    //     snapshot: snapshot,
                                    //     studentCount: ['nazraCount'],
                                    //     key: key,
                                    //   )
                                    ? Text(
                                        categoryTitle[pageIndex] +
                                            ' ${snapshot.data['nazraCount'].toString()}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w900,
                                            color: Theme.of(context)
                                                .primaryTextTheme
                                                .subtitle1!
                                                .color),
                                      )
                                    : pageIndex == 1
                                        ? Text(
                                            categoryTitle[pageIndex] +
                                                ' ${snapshot.data['hifzCount'].toString()}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w900,
                                                color: Theme.of(context)
                                                    .primaryTextTheme
                                                    .subtitle1!
                                                    .color),
                                          )
                                        : Text(
                                            categoryTitle[pageIndex] +
                                                ' ${snapshot.data['qaidaCount'].toString()}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w900,
                                                color: Theme.of(context)
                                                    .primaryTextTheme
                                                    .subtitle1!
                                                    .color),
                                          ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          } else {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        });
  }
}
