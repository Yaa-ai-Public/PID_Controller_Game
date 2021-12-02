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
  final List<double> shipPositionXTable = [0.35, -0.0, -0.85, 0.0, 0.25, 0.4];
  final List<double> shipPositionYTable = [0.35, 0.25, 0.1, 0.00, 0.00];
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
      canvas.save();
      final double scaleX = size.width / backgroundImage!.width;
      final double scaleY = size.height / backgroundImage!.height;
      canvas.scale(scaleX, scaleY);
      canvas.drawImage(backgroundImage!, Offset.zero, new Paint());
      canvas.restore();
      if (shipImage != null) {
        Offset shipOffset  = size.topLeft(Offset.zero)
          .translate(
                screenWidth*shipPositionX + screenWidth/2, 
                screenHeight*shipPositionY + screenHeight/2);
        
        canvas.drawImage(shipImage!, shipOffset, new Paint());
        // Rect rectShip = shipOffset & Size(scaleX*200, scaleX*200);
        // paintImage(canvas: canvas, rect: rectShip, image: shipImage!);
        if (hillImage != null) {
          canvas.save();
          canvas.scale(scaleX, scaleY);
          canvas.drawImage(hillImage!, Offset.zero, new Paint());
          canvas.restore();
        }
      }
      
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

