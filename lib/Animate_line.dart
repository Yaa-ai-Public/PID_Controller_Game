import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class AnimateLine extends StatelessWidget {
  const AnimateLine({Key? key}) : super(key: key);

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
                  height: MediaQuery.of(context).size.height / 1.15,
                  width: MediaQuery.of(context).size.width / 1.16,
                  color: Color(0xff119BFF).withOpacity(0.6),
                  child: CustomPaint(
                    painter: PathPainter(),
                  ),
                  /*child: GestureDetector(
                    onTap:() => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnimatedAlignWidget()),
                  ),
                  ),*/
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xffCA7A03)
      ..style = PaintingStyle.stroke

      ..strokeWidth = 10.0;


    Path path = Path();

    path.lineTo(250, 500);
    path.relativeLineTo(size.width/4, 50);

    canvas.drawPath(
        dashPath(
          path,
          dashArray: CircularIntervalList<double>(<double>[28.0, 8.5]), // Width and height of dashed line
        ),
        paint);
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
