import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;


class IntroductionAnimation extends StatefulWidget {
  const IntroductionAnimation({Key? key}) : super(key: key);

  @override
  _IntroductionAnimationState createState() => _IntroductionAnimationState();
}

class _IntroductionAnimationState extends State<IntroductionAnimation> {

  late double shipPosition = 0.0;
  ui.Image? image;
  bool isImageloaded = false;
  Timer? _timer;

  Future <Null> init() async {
    final ByteData data = await rootBundle.load('images/intro_animation_background.png');
    image = await loadImage(new Uint8List.view(data.buffer));
  }
  
  Future<ui.Image> loadImage(Uint8List img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      setState(() {
        isImageloaded = true;
      });
      return completer.complete(img);
    });
    return completer.future;
  }

  @override
  void initState() {
    super.initState();
    init();
    _timer = Timer.periodic(const Duration(milliseconds: 100), changePosition);
  }

  @override
  void dispose() {
    if (_timer != null)
      _timer!.cancel();
    super.dispose();
  }

  void changePosition(Timer t) async {  // callback function
      setState(() {
        shipPosition = shipPosition + 0.01;
        if (shipPosition >= 1.0) shipPosition = 0.0;
      });
  }

  @override
  Widget build(BuildContext context) {
    return  CustomPaint(
              painter: IntroductionAnimationPainter(
                shipPositionX: 10.0,
                shipPositionY: 10.0,
                image: image,
              ),
            );
  }
}

class IntroductionAnimationPainter extends CustomPainter {
  
  IntroductionAnimationPainter({
    required this.shipPositionX,
    required this.shipPositionY,
    required this.image,
  }) : imagePaint = Paint();
  
  final double shipPositionX;
  final double shipPositionY;
  final Paint imagePaint;
  final ui.Image? image;

  @override 
  void paint(Canvas canvas, Size size) {
    if (image != null) {
      Rect rect = const Offset(-2.0, -0.0) & size;
      paintImage(canvas: canvas, rect: rect, image: image!);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

