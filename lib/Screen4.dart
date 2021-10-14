import 'package:google_fonts/google_fonts.dart';

import 'Screen5.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class screen4 extends StatefulWidget {
  const screen4({Key key}) : super(key: key);

  @override
  _screen4State createState() => _screen4State();
}

class _screen4State extends State<screen4> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Level 1 \n \n " "Proportional Controller\n\n\n\n\n",
                  style: GoogleFonts.shadowsIntoLight(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => screen5()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: MediaQuery.of(context).size.width / 1.10,
                  height: MediaQuery.of(context).size.height / 12,
                  child: Center(
                    child: Text(
                      "Begin Mission",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
