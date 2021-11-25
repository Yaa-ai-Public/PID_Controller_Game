import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'introduction_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/screen1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Welcome to the \n"
                    "PID Game.\n\n"
                    "Ready to learn about the "
                    "Proportional Integrative Derivative Controller?\n",
                    style: GoogleFonts.shadowsIntoLight(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

                Container(
                  width: MediaQuery.of(context).size.width / 6.6,
                  height: MediaQuery.of(context).size.height / 14,

                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.lightBlueAccent,
                    ),
                    child: Text(
                      "Oh Yeah !",
                      style: GoogleFonts.shadowsIntoLight(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                  ),
                ),
             ),

            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            )


                  ]),
    ),
    );
  }
}
