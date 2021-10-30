import 'package:flutter/material.dart';
import 'package:pid_controller/Screen5.dart';

class screen6 extends StatelessWidget {
  const screen6({Key key}) : super(key: key);

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

      ),

    );
  }
}
