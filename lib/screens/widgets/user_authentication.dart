import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:mhm_website/screens/widgets/responsive.dart';
import 'package:mhm_website/screens/widgets/top_bar_contents.dart';

import '../../style.dart';
import 'explore_drawer.dart';

class UserAuth extends StatelessWidget {
  // const UserAuth({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  double _opacity = 0;

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
                  icon: Icon(Icons.brightness_6),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    EasyDynamicTheme.of(context).changeTheme();
                  },
                ),
              ],
              title: Text("Madrasah Hasnain Moavia"))
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(1),
            ),
      drawer: ExploreDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: screenSize.width,
              height: 130,
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 20,
                    child: Text(
                      'Login',
                      style: loginHeading,
                    ),
                  ),
                ],
              ),
            ),
            // Text Field
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.deepPurple,
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.deepPurple,
                          )),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Login  Button
            //loader
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    elevation: 10,
                    fixedSize: Size(screenSize.width * 0.9, 50)),
                onPressed: () async {},
                child: Text(
                  'Login',
                  style: loginbutton,
                )),
            // Google/facebook Authentication
            SizedBox(
              height: 10,
            ),

            Row(children: <Widget>[
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 30.0, right: 20.0),
                    child: Divider(
                      color: Colors.black,
                      height: 36,
                    )),
              ),
              Text(
                "OR CONNECT WITH",
                style: connect,
              ),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 30.0),
                    child: Divider(
                      color: Colors.black,
                      height: 36,
                    )),
              ),
            ]),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Expanded(
                  //   child: SignInButton(
                  //     Buttons.Google,
                  //     elevation: 10,
                  //     text: "Google".toUpperCase(),
                  //     shape: StadiumBorder(),
                  //     onPressed: () {},
                  //   ),
                  // ),
                  SizedBox(
                    width: 10,
                  ),
                  // Expanded(
                  //   child: SignInButton(
                  //     Buttons.Facebook,
                  //     elevation: 10,
                  //     text: "Facebook".toUpperCase(),
                  //     shape: StadiumBorder(),
                  //     onPressed: () {},
                  //   ),
                  // ),
                  // ElevatedButton.icon(
                  //     onPressed: () {},
                  //     icon: Icon(Icons.mail),
                  //     label: Text('Gogle'.toUpperCase())),
                ],
              ),
            ),
            // sign up
            SizedBox(
              width: screenSize.width,
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                    top: 60,
                    right: 20,
                    child: GestureDetector(
                      // dragStartBehavior: DragStartBehavior.start,
                      onTap: () {
                        // Navigator.pushNamed(context, SignupScreen.id);
                      },
                      child: Text(
                        'Sign Up',
                        style: loginHeading,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
