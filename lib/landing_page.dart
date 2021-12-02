import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pid_controller/introduction_page.dart';
import 'package:pid_controller/introduction_animation.dart';
import 'package:pid_controller/Begin_Mission.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0x44000000),
        elevation: 0,
        title: AnimatedBuilder(
          animation: _pageController,
          builder: (context, snapshot) { 
          return
            CustomPaint(
              painter: PageIndicatorPainter(
                pageCount: 5,
                dotRadius: 10,
                dotOutlineThickness: 2,
                spacing: 25,
                scrollPosition: (_pageController.hasClients ? _pageController.page : 0.0)!,
                dotFillColor: const Color(0x0FFFFFFF),
                dotOutlineColor: const Color(0x20FFFFFF),
                indicatorColor:  Colors.lightBlueAccent,
              ),
            );
          },
        
        ),
        foregroundColor: Colors.white,
      ),
      body: PageView (
        controller: _pageController,
        children: <Widget>[
          WelcomePage(),
          IntroductionPage(),
          IntroductionAnimation(),
          BeginMissionScreen(),
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
    final double laggingLeftPositionPercent 
      = (transitionPercent - 0.3).clamp(0.0, 1.0) / 0.7;

    final double indicatorLeftX = leftDotX + (laggingLeftPositionPercent * ((2 * dotRadius) + spacing));

    final double acceleratedRightPositionPercent = (transitionPercent / 0.5).clamp(0.0, 1.0);

    final double indicatorRightX = 
      leftDotX + 
      (acceleratedRightPositionPercent * ((2 * dotRadius) + spacing)) + 
      (2 * dotRadius); 

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

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  WelcomePageState createState() => WelcomePageState();
}


class WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Center(
                      child: Text(
                        "Welcome to the "
                        "PID Game.\n"
                        "Ready to learn about the "
                        "Proportional Integrative Derivative Controller?\n"
                        "Swipe Left to continue ...",
                        style: GoogleFonts.shadowsIntoLight(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ), 
              ]),
          );
  }
  
}