import 'package:flutter/material.dart';

import 'bottom_bar_column.dart';
import 'info_text.dart';
import 'responsive.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: Colors.deepPurple,
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                    ),
                    BottomBarColumn(
                      heading: 'HELP',
                      s1: 'Payment',
                      s2: 'Cancellation',
                      s3: 'FAQ',
                    ),
                    BottomBarColumn(
                      heading: 'SOCIAL',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'YouTube',
                    ),
                  ],
                ),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                const SizedBox(height: 20),
                InfoText(
                  type: 'Phone',
                  text: '+92 322 2060194',
                ),
                const SizedBox(height: 5),
                InfoText(
                  type: 'Email',
                  text: 'madarsahasnainmoavia@gmail.com',
                ),
                const SizedBox(height: 5),
                InfoText(
                  type: 'Address',
                  text:
                      'Babar Plaza, 1st FLoar, Godhra Gali, Nanakwada, Karachi',
                ),
                const SizedBox(height: 20),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Copyright © 2022 MHM | Developed By Abdul Sattar Suleman',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                    ),
                    BottomBarColumn(
                      heading: 'HELP',
                      s1: 'Payment',
                      s2: 'Cancellation',
                      s3: 'FAQ',
                    ),
                    BottomBarColumn(
                      heading: 'SOCIAL',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'YouTube',
                    ),
                    Container(
                      color: Colors.blueGrey,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoText(
                          type: 'Phone',
                          text: '+92 322 2060194',
                        ),
                        const SizedBox(height: 5),
                        InfoText(
                          type: 'Email',
                          text: 'madarsahasnainmoavia@gmail.com',
                        ),
                        const SizedBox(height: 5),
                        InfoText(
                          type: 'Address',
                          text: 'Godhra Gali,nanakwada,karachi.',
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blueGrey,
                    width: double.maxFinite,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Copyright © 2022 MHM | Developed By Abdul Sattar Suleman',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }
}
