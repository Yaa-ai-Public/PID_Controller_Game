import 'package:flutter/material.dart';
import 'package:pid_controller/Begin_Mission.dart';

class screen3 extends StatefulWidget {
  const screen3({Key key}) : super(key: key);

  @override
  _screen3State createState() => _screen3State();
}

class _screen3State extends State<screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell( child:
          Icon(Icons.arrow_forward_ios,
            color: Colors.white,

          ),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => screen4()));
            }
          ),
        ],
        backgroundColor: Colors.black,
      ),
    body:
      Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/boat.gif",
          ),
          fit: BoxFit.cover,
        )
      ),
      ),
    );
  }
}
