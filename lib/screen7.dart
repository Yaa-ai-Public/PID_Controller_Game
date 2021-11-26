import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedAlignWidget extends StatefulWidget {
  @override
  _AnimatedAlignWidgetState createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  AlignmentGeometry _alignment = Alignment.topRight;
  AlignmentGeometry _geometry = Alignment.bottomLeft;

  void _changeAlignment() {
    setState(() {
      _alignment = _alignment == Alignment.topRight
          ? Alignment.bottomLeft
          : Alignment.topRight;
      _geometry = _alignment == Alignment.topRight
          ? Alignment.bottomLeft
          : Alignment.topRight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk_amU8TCigJlFNVhMP60Qz_5_Bz7BSpuv6Q&usqp=CAU"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: _alignment,
              curve: Curves.easeInOutBack,
              duration: Duration(seconds: 3),
              child: Image.asset(
                'images/redbird.png',
                height: 75,
                width: 75,
              ),
            ),
            AnimatedAlign(
              alignment: _geometry,
              curve: Curves.easeInCirc,
              duration: Duration(seconds: 3),
              child: Image.asset(
                'images/yellowbird.png',
                height: 75,
                width: 75,
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () => _changeAlignment(),
                child: Text('START'),
              ),
            )
          ],
        ),
      ),
    );
  }
}