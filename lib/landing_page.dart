import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pid_controller/introduction_page.dart';

class LandingPage extends StatefulWidget {

   @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  void nextPage() {
    final player = AudioPlayer();
    player.setAsset('sounds/219477__jarredgibb__button-04.mp3');
    player.play();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen2()),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0x44000000),
        elevation: 0,
        title: CustomPaint(
          painter: PageIndicatorPainter(
            pageCount: 4,
            dotRadius: 10,
            dotOutlineThickness: 3,
            spacing: 25,
            dotFillColor: const Color(0x0F0000000),
            dotOutlineColor: const Color(0x20000000),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/screen1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Welcome to the \n"
                      "PID Game.\n\n"
                      "Ready to learn about the "
                      "Proportional Integrative Derivative Controller?\n",
                      style: GoogleFonts.shadowsIntoLight(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                  child: TextButton(
                    child: Text("Oh Yeah !",
                        style: GoogleFonts.shadowsIntoLight(fontSize: 30)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(0)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.lightBlueAccent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ))),
                    onPressed: () =>  nextPage(),
                  ),
                ),
            ]),
      ),
    );
  }
}

class PageIndicatorPainter extends CustomPainter {
  
  PageIndicatorPainter({
    @required this.pageCount,
    @required this.dotRadius,
    @required this.dotOutlineThickness,
    @required this.spacing,
    @required dotFillColor,
    @required dotOutlineColor,
  }) :  dotFillPaint = Paint()..color = dotFillColor, 
        dotOutlinePaint = Paint()..color = dotOutlineColor;
  
  final int pageCount;
  final double dotRadius;
  final double dotOutlineThickness;
  final double spacing;
  final Paint dotFillPaint;
  final Paint dotOutlinePaint;

  @override 
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final double totalWidth = (pageCount * (2 * dotRadius)) + ((pageCount - 1) * spacing);
    final Offset leftDotCenter = center.translate((-totalWidth / 2) + dotRadius, 0);

    _drawDot(canvas, leftDotCenter);
  }

  void _drawDot(Canvas canvas, Offset dotCenter) {
    canvas.drawCircle(dotCenter, dotRadius, dotFillPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}