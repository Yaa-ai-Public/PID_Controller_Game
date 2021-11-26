import 'package:flutter/material.dart';
import 'package:pid_controller/How_button.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimateLine extends StatefulWidget {
  const AnimateLine({Key key}) : super(key: key);

  @override
  _AnimateLineState createState() => _AnimateLineState();
}

class _AnimateLineState extends State<AnimateLine> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
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
                  height: MediaQuery.of(context).size.height / 1.12,
                  width: MediaQuery.of(context).size.width / 1.15,
                  color: Colors.blueAccent.withOpacity(0.8),
                  child: AnimatedAlign(
                    alignment:
                        selected ? Alignment.topRight : Alignment.bottomLeft,
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(seconds: 3),
                    child: FlutterLogo(
                      size: 50,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
