import 'package:flutter/material.dart';


class screen2 extends StatefulWidget {
  const screen2({Key key}) : super(key: key);

  @override
  _screen2State createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Text("Hello, I am 2nd Screen",
        style:  TextStyle(
          fontSize: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
