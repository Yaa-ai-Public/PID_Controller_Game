import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'Animate_line.dart';

class BeginMissionScreen extends StatefulWidget {
  const BeginMissionScreen({Key? key}) : super(key: key);

  @override
  _BeginMissionScreenState createState() => _BeginMissionScreenState();
}

class _BeginMissionScreenState extends State<BeginMissionScreen> {
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
                      "Level 1 \n\n"
                      "Proportional Controller\n\n",
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
                padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                child: TextButton(
                  child: Text("Begin Mission",
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
                  onPressed: () => {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => AnimateLine())),
                  },
                  ),
                ),
            ]),
      ),
    );
  }
}
