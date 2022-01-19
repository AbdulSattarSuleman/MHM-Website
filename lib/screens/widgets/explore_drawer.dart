import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mhm_website/screens/widgets/user_authentication.dart';
import 'package:url_launcher/url_launcher.dart';

class ExploreDrawer extends StatefulWidget {
  const ExploreDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _ExploreDrawerState createState() => _ExploreDrawerState();
}

class _ExploreDrawerState extends State<ExploreDrawer> {
  bool _isProcessing = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).bottomAppBarColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // userEmail == null
              //     ? Container(
              //         width: double.maxFinite,
              //         child: TextButton(
              //           // color: Colors.black,
              //           // hoverColor: Colors.blueGrey[800],
              //           // highlightColor: Colors.blueGrey[700],
              //           style: TextButton.styleFrom(
              //             primary: Colors.black,
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(15),
              //             ),
              //           ),
              //           onPressed: () {
              //             showDialog(
              //               context: context,
              //               builder: (context) => AuthDialog(),
              //             );
              //           },
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(15),
              //           ),
              //           child: Padding(
              //             padding: EdgeInsets.only(
              //               top: 15.0,
              //               bottom: 15.0,
              //             ),
              //             child: Text(
              //               'Sign in',
              //               style: TextStyle(
              //                 fontSize: 20,
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ),
              //         ),
              //       )
              //     : Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         mainAxisSize: MainAxisSize.max,
              //         children: [
              //           CircleAvatar(
              //             radius: 20,
              //             backgroundImage:
              //                 imageUrl != null ? NetworkImage(imageUrl!) : null,
              //             child: imageUrl == null
              //                 ? Icon(
              //                     Icons.account_circle,
              //                     size: 40,
              //                   )
              //                 : Container(),
              //           ),
              //           SizedBox(width: 10),
              //           Text(
              //             name ?? userEmail!,
              //             style: TextStyle(
              //               fontSize: 20,
              //               color: Colors.white70,
              //             ),
              //           )
              //         ],
              //       ),

              const Text("USEFUL LINKS",
                  style: TextStyle(color: Colors.white, fontSize: 34)),
              const SizedBox(height: 20),

              // userEmail != null ? const SizedBox(height: 20) : Container(),

              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Home',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey[400],
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Prayer Time',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey[400],
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Services',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey[400],
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey[400],
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => UserAuth()));
                },
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  launch(
                                      "https://www.facebook.com/MadrasahHasnainMoavia/");
                                },
                                child: const Icon(FontAwesomeIcons.facebook)),
                            const SizedBox(
                              width: 4,
                            ),
                            IconButton(
                                onPressed: () {
                                  launch(
                                      "https://www.instagram.com/madrasahhasnainmoavia/");
                                },
                                icon: Icon(FontAwesomeIcons.instagram)),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            IconButton(
                                onPressed: () {
                                  launch("https://twitter.com/mhmofficial_1");
                                },
                                icon: Icon(FontAwesomeIcons.twitter)),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            IconButton(
                                onPressed: () {
                                  launch(
                                      "https://www.youtube.com/user/islahibayanmhm");
                                },
                                icon: Icon(
                                  FontAwesomeIcons.youtube,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Copyright © 2022 | MHM Developed By Abdul Sattar',
                          style: TextStyle(
                            color: Colors.blueGrey[300],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
