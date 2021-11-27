import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pid_controller/introduction_animation.dart';

class screen2 extends StatefulWidget {
  const screen2({Key? key}) : super(key: key);

  @override
  _screen2State createState() => _screen2State();
}

class _screen2State extends State<screen2> {
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
          mainAxisAlignment: MainAxisAlignment.end,
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
                    " the PID controller to make one of the the first\n autopilot ships !",
                    style: GoogleFonts.shadowsIntoLight(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
              child: TextButton(
                child: Text("I am ready to steer",
                    style: GoogleFonts.shadowsIntoLight(fontSize: 30)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(0)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.lightBlueAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => screen3()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
