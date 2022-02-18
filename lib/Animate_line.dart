import 'package:flutter/material.dart';
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
      ..style = PaintingStyle.fill


      ..strokeWidth = 10.0;


    /*Path path = Path();
    path.moveTo(size.width*0.83, size.height *0.24);
    path.quadraticBezierTo(size.width/1, size.height/4.5, size.width/4.5, size.height / 1.19);
    path.close();


    canvas.drawPath(

        dashPath(
          path,
          dashArray: CircularIntervalList<double>(<double>[28.0, 8.5]), // Width and height of dashed line
        ),

        paint);
*/

   Path path = Path();

    path.moveTo(0, size.height * 0.65); // down curve

    path.quadraticBezierTo(size.width / 4.2, size.height / 0.99, size.width / 2.1,
        size.height /1.6);
    path.quadraticBezierTo(
        size.width / 3, size.height * 0.29, 0, size.height /1.7);//left top

    paint.color = colorThree;
    canvas.drawPath(path, paint);



  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
