import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screen2.dart';

class myFirstGame extends StatefulWidget {
  const myFirstGame({Key key}) : super(key: key);

  @override
  _myFirstGameState createState() => _myFirstGameState();
}

class _myFirstGameState extends State<myFirstGame> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 50, 0, 10),
                  child: Text(
                    "Welcome to the",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 40),
                  child: Text(
                    "PID game",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 0, 0, 60),
                  child: Text(
                    "Ready to learn about the Proportional Integrative Derivative Controller?",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w200,
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => screen2()),
                            );
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width / 1.15,
                              height: MediaQuery.of(context).size.height / 12,
                              color: Colors.lightBlueAccent,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(90, 10, 0, 0),
                                child: Text(
                                  "Oh yeah!",
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
