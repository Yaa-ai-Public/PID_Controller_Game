import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pid_controller/introduction_page.dart';

class LandingPage extends StatefulWidget {

   @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  void nextPage() {
    final player = AudioPlayer();
    player.setAsset('sounds/219477__jarredgibb__button-04.mp3');
    player.play();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen2()),);
  }

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
              Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                  child: TextButton(
                    child: Text("Oh Yeah !",
                        style: GoogleFonts.shadowsIntoLight(fontSize: 30)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(0)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.lightBlueAccent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ))),
                    onPressed: () =>  nextPage(),
                  ),
                ),
            ]),
      ),
    );
  }
}
