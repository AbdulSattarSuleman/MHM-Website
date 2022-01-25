import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:mhm_website/screens/duas_screen.dart';
import 'package:mhm_website/screens/widgets/auth/login_screen.dart';

import '../home_screen.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Theme.of(context).bottomAppBarColor.withOpacity(widget.opacity),
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/mhm_logo.png",
                width: 200,
                height: 120,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: screenSize.width / 8),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomePage()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(
                              color: _isHovering[0]
                                  ? Colors.blue[200]
                                  : Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[1] = true
                              : _isHovering[1] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Prayer Time',
                            style: TextStyle(
                              color: _isHovering[1]
                                  ? Colors.blue[200]
                                  : Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[3] = true
                              : _isHovering[3] = false;
                        });
                      },
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => PrayerDuaScreen()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Prayers For Daily Use',
                            style: TextStyle(
                              color: _isHovering[3]
                                  ? Colors.blue[200]
                                  : Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[3],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[2] = true
                              : _isHovering[2] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Events',
                            style: TextStyle(
                              color: _isHovering[2]
                                  ? Colors.blue[200]
                                  : Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[2],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[5] = true
                              : _isHovering[5] = false;
                        });
                      },
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Register',
                            style: TextStyle(
                              color: _isHovering[5]
                                  ? Colors.blue[200]
                                  : Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[5],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
              IconButton(
                icon: Icon(Icons.brightness_6),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                color: Colors.white,
                onPressed: () {
                  EasyDynamicTheme.of(context).changeTheme();
                },
              ),
              // SizedBox(
              //   width: screenSize.width / 50,
              // ),
              // InkWell(
              //   onHover: (value) {
              //     setState(() {
              //       value ? _isHovering[3] = true : _isHovering[3] = false;
              //     });
              //   },
              //   onTap: userEmail == null
              //       ? () {
              //           showDialog(
              //             context: context,
              //             builder: (context) => AuthDialog(),
              //           );
              //         }
              //       : null,
              //   child: userEmail == null
              //       ? Text(
              //           'Sign in',
              //           style: TextStyle(
              //             color: _isHovering[3] ? Colors.white : Colors.white70,
              //           ),
              //         )
              //       : Row(
              //           children: [
              //             CircleAvatar(
              //               radius: 15,
              //               backgroundImage: imageUrl != null
              //                   ? NetworkImage(imageUrl!)
              //                   : null,
              //               child: imageUrl == null
              //                   ? Icon(
              //                       Icons.account_circle,
              //                       size: 30,
              //                     )
              //                   : Container(),
              //             ),
              //             SizedBox(width: 5),
              //             Text(
              //               name ?? userEmail!,
              //               style: TextStyle(
              //                 color: _isHovering[3]
              //                     ? Colors.white
              //                     : Colors.white70,
              //               ),
              //             ),
              //             SizedBox(width: 10),
              //             TextButton(
              //               style: TextButton.styleFrom(
              //                 primary: Colors.blueGrey,
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(15),
              //                 ),
              //               ),
              //               onPressed: _isProcessing
              //                   ? null
              //                   : () async {
              //                       setState(() {
              //                         _isProcessing = true;
              //                       });
              //                       await signOut().then((result) {
              //                         print(result);
              //                         Navigator.of(context).pushReplacement(
              //                           MaterialPageRoute(
              //                             fullscreenDialog: true,
              //                             builder: (context) => HomePage(),
              //                           ),
              //                         );
              //                       }).catchError((error) {
              //                         print('Sign Out Error: $error');
              //                       });
              //                       setState(() {
              //                         _isProcessing = false;
              //                       });
              //                     },
              //               child: Padding(
              //                 padding: EdgeInsets.only(
              //                   top: 8.0,
              //                   bottom: 8.0,
              //                 ),
              //                 child: _isProcessing
              //                     ? CircularProgressIndicator()
              //                     : Text(
              //                         'Sign out',
              //                         style: TextStyle(
              //                           fontSize: 14,
              //                           color: Colors.white,
              //                         ),
              //                       ),
              //               ),
              //             )
              //           ],
              //         ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
