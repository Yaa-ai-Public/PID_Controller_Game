import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'landing_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final AudioPlayer player = AudioPlayer();
  @override
  void initState() {
    super.initState();
    player.setLoopMode(LoopMode.one);
    player.setAsset('sounds/530703__szegvari__water-wave-beach-peoples-ships-field-recording-200815-0039.mp3');
    player.play();
  }
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
        Theme.of(context).textTheme,),
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingPage(
      ),
    );
  }
}
