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

  late double shipPositionTime = 0.0;
  final List<double> shipPositionXTable = [0.35, -0.0, -0.45, 0.0, 0.25, 0.4];
  final List<double> shipPositionYTable = [0.35, 0.30, 0.17, 0.12, 0.12];
  late double shipPosX = shipPositionXTable[0];
  late double shipPosY = shipPositionYTable[0];
  
  ui.Image? backgroundImage;
  ui.Image? shipImage;
  ui.Image? hillImage;
  bool isBackgroundImageloaded = false;
  bool isShipImageloaded = false;
  bool isHillImageloaded = false;
  Timer? _timer;

  Future <Null> init() async {
    final ByteData dataBackground = await rootBundle.load('images/intro_animation_background.png');
    final ByteData dataShip = await rootBundle.load('images/boat.png');
    final ByteData dataHill = await rootBundle.load('images/hill.png');
    backgroundImage = await loadBackgroundImage(new Uint8List.view(dataBackground.buffer));
    shipImage = await loadShipImage(new Uint8List.view(dataShip.buffer));
    hillImage = await loadShipImage(new Uint8List.view(dataHill.buffer));
  }
  
  Future<ui.Image> loadBackgroundImage(Uint8List img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      setState(() {
        isBackgroundImageloaded = true;
      });
      return completer.complete(img);
    });
    return completer.future;
  }

  Future<ui.Image> loadShipImage(Uint8List img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      setState(() {
        isShipImageloaded = true;
      });
      return completer.complete(img);
    });
    return completer.future;
  }

  Future<ui.Image> loadHillImage(Uint8List img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      setState(() {
        isHillImageloaded = true;
      });
      return completer.complete(img);
    });
    return completer.future;
  }

  double interpolateArray(List<double> data, double t)
  {
    t = t.clamp(0.0, 1.0);
    final int index1 = (t*(data.length - 1)).floor();
    final int index2 = index1 + 1;
    final double tIndex1 = index1.toDouble()/(data.length.toDouble() - 1.0); 
    final double tIndex2 = index2.toDouble()/(data.length.toDouble() - 1.0); 

    // return the last value if we are past the end
    if (index2 >= data.length) return data[data.length - 1]; 

    // interpolation
    final double y2 = data[index2];
    final double y1 = data[index1];
    final double y = y1 + ((t - tIndex1)/(tIndex2 - tIndex1))*(y2 - y1);
    return y;
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
        shipPositionTime = shipPositionTime + 0.02;
        if (shipPositionTime >= 1.0) shipPositionTime = 0.0;

        // calculate new ship positions
        shipPosX = interpolateArray(shipPositionXTable, shipPositionTime);
        shipPosY = interpolateArray(shipPositionYTable, shipPositionTime);
      });
  }

  @override
  Widget build(BuildContext context) {
    return  CustomPaint(
              painter: IntroductionAnimationPainter(
                shipPositionX: shipPosX,
                shipPositionY: shipPosY,
                backgroundImage: backgroundImage,
                shipImage: shipImage,
                hillImage: hillImage,
              ),
            );
  }
}

class IntroductionAnimationPainter extends CustomPainter {
  
  IntroductionAnimationPainter({
    required this.shipPositionX,
    required this.shipPositionY,
    required this.backgroundImage,
    required this.shipImage,
    required this.hillImage,
  });
  
  final double shipPositionX;
  final double shipPositionY;
  final ui.Image? backgroundImage;
  final ui.Image? shipImage;
  final ui.Image? hillImage;

  @override 
  void paint(Canvas canvas, Size size) {
    if (backgroundImage != null) {
      final double screenWidth = size.width;
      final double screenHeight = size.height;
      Rect rect = Rect.fromLTWH(-2.0, 0.0, screenWidth*1.02, screenHeight*1.02);
      paintImage(canvas: canvas, rect: rect, image: backgroundImage!);
      if (shipImage != null) {
        Offset shipOffset  = size.center(Offset.zero)
          .translate(screenWidth*shipPositionX, screenHeight*shipPositionY);
        Rect rectShip = shipOffset & const Size(90.0, 90.0);
        paintImage(canvas: canvas, rect: rectShip, image: shipImage!);
        if (hillImage != null) {
          Offset hillOffset  = size.center(Offset.zero)
          .translate(-45.0, 40.0);
          Rect rectHill = hillOffset & const Size(260.0, 260.0);
          paintImage(canvas: canvas, rect: rectHill, image: hillImage!);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

