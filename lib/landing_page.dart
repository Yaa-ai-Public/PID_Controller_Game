import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pid_controller/introduction_page.dart';

class LandingPage extends StatefulWidget {

  const LandingPage({Key? key}) : super(key: key);

   @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
            dotOutlineThickness: 2,
            spacing: 25,
            scrollPosition: 2.75,
            dotFillColor: const Color(0x0FFFFFFF),
            dotOutlineColor: const Color(0x20FFFFFF),
            indicatorColor:  Colors.lightBlueAccent,
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: PageView (
        controller: _pageController,
        children: <Widget>[
        Container(
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
                        "PID Game (Page 1).\n\n"
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
          Container(
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
                        "PID Game (Page 2).\n\n"
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
          
          ]
        ),
    );
  }
}

class PageIndicatorPainter extends CustomPainter {
  
  PageIndicatorPainter({
    required this.pageCount,
    required this.dotRadius,
    required this.dotOutlineThickness,
    required this.spacing,
    this.scrollPosition = 0.0,
    required Color dotFillColor,
    required Color dotOutlineColor,
    required Color indicatorColor,
  }) :  dotFillPaint = Paint()..color = dotFillColor, 
        dotOutlinePaint = Paint()..color = dotOutlineColor,
        indicatorPaint = Paint()..color = indicatorColor;
  
  final int pageCount;
  final double dotRadius;
  final double dotOutlineThickness;
  final double spacing;
  final double scrollPosition;
  final Paint dotFillPaint;
  final Paint dotOutlinePaint;
  final Paint indicatorPaint;

  @override 
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final double totalWidth = (pageCount * (2 * dotRadius)) + ((pageCount - 1) * spacing);
    _drawDots(canvas, center, totalWidth);
    _drawPageIndicator(canvas, center, totalWidth);
  }

  void _drawDots(Canvas canvas, Offset center, double totalWidth) {
    Offset dotCenter = center.translate((-totalWidth / 2) + dotRadius, 0);

    for (int i = 0; i < pageCount; ++i) {
      _drawDot(canvas, dotCenter);
      dotCenter = dotCenter.translate((2 * dotRadius) + spacing, 0);
    }
  }

  void _drawPageIndicator(Canvas canvas, Offset center, double totalWidth) {
    final int pageIndexToLeft = scrollPosition.floor();
    final double leftDotX = 
      (center.dx - (totalWidth / 2)) 
      + (pageIndexToLeft * ((2 * dotRadius) + spacing));
    final double transitionPercent = scrollPosition - pageIndexToLeft;
    final double indicatorLeftX = leftDotX + (transitionPercent * ((2 * dotRadius) + spacing));
    final double indicatorRightX = indicatorLeftX + (2 * dotRadius); 

    canvas.drawRRect(RRect.fromLTRBR(
      indicatorLeftX, 
      -dotRadius, 
      indicatorRightX, 
      dotRadius, Radius.circular(dotRadius)), indicatorPaint);
  }

  void _drawDot(Canvas canvas, Offset dotCenter) {
    canvas.drawCircle(dotCenter, dotRadius - dotOutlineThickness, dotFillPaint);
    Path outlinePath = Path()
      ..addOval(Rect.fromCircle(center: dotCenter, radius: dotRadius))
      ..addOval(Rect.fromCircle(center: dotCenter, radius: dotRadius - dotOutlineThickness))
      ..fillType = PathFillType.evenOdd;
    canvas.drawPath(outlinePath, dotOutlinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}