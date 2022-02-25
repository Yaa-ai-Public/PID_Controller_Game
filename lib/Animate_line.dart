import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_drawing/path_drawing.dart';

Color colorOne = Color(0xffCE7C00).withOpacity(0.9);

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

    //Islands drawing using path function.
    Path path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.9);
    path.cubicTo(0, size.height * 1, size.width * 0.3, size.height * 0.9,
        size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height * 0.1);

    //Calling most essential component to implement drawing in screen through canvas
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
    Offset circle1 = Offset(size.width * 0.8, size.height * 0.1);
    paint.color = Colors.green;
    paint.style = PaintingStyle.fill;

    canvas.drawCircle(
      circle1,
      40,
      paint,
    );

    //Drawing Island on Side
    path = Path();
    path.lineTo(size.width*0, size.height*0.3);
    path.moveTo(size.width*0, size.height*0.5);
    path.quadraticBezierTo(size.width*0.9, size.height*0.1, size.width*0, size.height*0.1);

    paint.color = colorOne;
    canvas.drawPath(path, paint);

    //Drawing alphabet or text using TextSpan on canvas

    final textspan = TextSpan(
      text: 'A',
      style: GoogleFonts.shadowsIntoLight(
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

    final offset = Offset(size.width * 0.76, size.height * 0.04);
    textPainter.paint(canvas, offset);

    final textspan1 = TextSpan(
      text: 'B',
      style: GoogleFonts.shadowsIntoLight(
        color: Colors.white,
        fontSize: 50,
      ),
    );

    final textPainter1 = TextPainter(
      text: textspan1,
      textDirection: TextDirection.ltr,
    );

    textPainter1.layout(
      minWidth: 05,
      maxWidth: size.width,
    );

    final offset1 = Offset(size.width * 0.16, size.height / 1.2);
    textPainter1.paint(canvas, offset1);

    // island text

    final textspan2 = TextSpan(
      text: 'Island',
      style: GoogleFonts.shadowsIntoLight(
        color: Colors.white,
        fontSize: 50,
      ),
    );

    final textPainter2 = TextPainter(
      text: textspan2,
      textDirection: TextDirection.ltr,
    );

    textPainter2.layout(
      minWidth: 05,
      maxWidth: size.width,
    );

    final offset2 = Offset(size.width * 0.1, size.height*0.15);
    textPainter2.paint(canvas, offset2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
