import 'package:flutter/material.dart';

class IntroductionText extends StatelessWidget {
  const IntroductionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              width: screenSize.width * 0.4,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/intro.jpg',
                  fit: BoxFit.cover,
                  height: 300,
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 70, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Madarsa Hasnain Moavia (R.A)",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "Madrasah Hasnain Moavia | Deatrust, One of the most significant investments of all time with the tremendous return is to develop the firmness in the Emaan (faith) of the children, who cherish human values and become a treasured asset to society."),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Alhamdulillah, we are honoured to have Madrasah Hasnain Moavia in Godhra Gali since 1998. The primary objective is to teach Qur’an with the Tajweed (pronunciation rules) and Makhraj (learning and practicing the origin of pronunciation). Currently, Madrasah is providing Hifz, Nazra, and Qaida facilities under the guidance of experienced teachers.",
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "The Madrasah focuses on bringing the best Islamic environments for the children to learn and practice Islamic teaching, etiquettes, and moral values to become an example to society.",
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
