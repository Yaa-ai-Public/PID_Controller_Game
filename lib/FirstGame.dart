import 'package:flutter/material.dart';

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

            Text("     Welcome to the",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            Text("          PID  game",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ],
        ),

      ),
    );
  }
}
