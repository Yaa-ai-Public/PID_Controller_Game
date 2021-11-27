import 'package:flutter/material.dart';
import 'package:pid_controller/How_button.dart';
import 'package:google_fonts/google_fonts.dart';

class screen6 extends StatelessWidget {
  const screen6({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/1.12,
                  width: MediaQuery.of(context).size.width/1.15,
                  color: Colors.blueAccent.withOpacity(0.8),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
