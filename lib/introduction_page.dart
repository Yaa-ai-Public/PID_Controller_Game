import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/screen1.jpg"),
          fit: BoxFit.cover,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "For the history buff in\n  you ...\n\n"
                    "We will follow the\n"
                    " footsteps of Mr. Elmer "
                    "Sperry, who developed\n"
                    " the PID controller to make one of the the first\n autopilot ships !\n\n"
                    "Swipe Left or Right for next/previous page",
                    style: GoogleFonts.shadowsIntoLight(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
