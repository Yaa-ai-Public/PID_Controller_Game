import 'package:flutter/material.dart';
import 'package:pid_controller/Begin_Mission.dart';
import 'dart:async';

class screen3 extends StatefulWidget {
  const screen3({Key key}) : super(key: key);

  @override
  _screen3State createState() => _screen3State();
}

class _screen3State extends State<screen3> {
  bool selected = true;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                screen4()
            )
        )
    );
  }
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            "images/boat.gif",
          ),
          fit: BoxFit.cover,
        )),
    );
  }
}
