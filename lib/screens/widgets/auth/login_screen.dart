import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:mhm_website/screens/utils/authentication.dart';
import 'package:mhm_website/screens/widgets/responsive.dart';
import 'package:mhm_website/screens/widgets/top_bar_contents.dart';

import '../../../style.dart';
import '../explore_drawer.dart';
// enum Buttons{
//     Email,
//     Google,
//     Facebook,
// }

class LoginScreen extends StatelessWidget {
  // const UserAuth({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

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
      drawer: const ExploreDrawer(),
      body: SafeArea(
        child: ResponsiveWidget.isSmallScreen(context)
            ? Column(
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
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(20))),
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Colors.deepPurple,
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(
                                  Icons.lock_outline_rounded,
                                  color: Colors.deepPurple,
                                )),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Login  Button
                  //loader
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          elevation: 10,
                          fixedSize: Size(screenSize.width * 0.9, 50)),
                      onPressed: () async {
                        SignInWithEmailAndPassword(context,
                            emailController.text, passwordController.text);
                      },
                      child: Text(
                        'Login',
                        style: loginbutton,
                      )),
                  // Google/facebook Authentication
                  const SizedBox(
                    height: 10,
                  ),
                ],
                //Desktop
              )
            : Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      screenSize.width * 0.3, 0, screenSize.width * 0.3, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: loginHeading,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Text Field
                      Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        // margin: EdgeInsets.fromLTRB(screenSize.width * 0.3, 0,
                        //     screenSize.width * 0.3, 10),
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              TextField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                    hintText: "Email",
                                    prefixIcon: Icon(
                                      Icons.person_outline,
                                      color: Colors.deepPurple,
                                    )),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    hintText: "Password",
                                    prefixIcon: Icon(
                                      Icons.lock_outline_rounded,
                                      color: Colors.deepPurple,
                                    )),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //Login  Button
                      //loader
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                elevation: 10,
                                fixedSize: Size(screenSize.width * 0.3, 50)),
                            onPressed: () async {
                              SignInWithEmailAndPassword(
                                  context,
                                  emailController.text,
                                  passwordController.text);
                            },
                            child: Text(
                              'Login',
                              style: loginbutton,
                            )),
                      ),

                      // sign up
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
