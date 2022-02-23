import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_drawing/path_drawing.dart';

Color colorThree = Color(0xffCE7C00).withOpacity(0.8);

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
    path.moveTo(size.width * 0.2, size.height * 0.9);
    path.cubicTo(0, size.height * 1, size.width * 0.3, size.height * 0.9,
        size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height * 0.1);

    canvas.drawPath(
        dashPath(
          path,
          dashArray: CircularIntervalList<double>(
              <double>[28.0, 8.5]), // Width and height of dashed line
        ),
        paint);

    path = Path();
    Offset circle = Offset(size.width * 0.2, size.height * 0.9);
    path.close();
    paint.color = Colors.green;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(circle, 40, paint);

    path = Path();
    Offset Circle = Offset(size.width * 0.8, size.height * 0.1);
    paint.color = Colors.green;
    paint.style = PaintingStyle.fill;
    TextSpan span =
        new TextSpan(style: new TextStyle(color: Colors.grey[600]), text: 'A');
    canvas.drawCircle(
      Circle,
      40,
      paint,
    );
    final textspan = TextSpan(
      text: 'A',
      style:
      GoogleFonts.shadowsIntoLight(

        color: Colors.white,
        fontSize: 50,
      ),
    );
    final textPainter = TextPainter(
      text: textspan,

      textDirection: TextDirection.rtl,
    );
    textPainter.layout(
      minWidth: 10,
      maxWidth: size.width,
    );
    final offset = Offset(size.width*0.76, size.height*0.04);

    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
