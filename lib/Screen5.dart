import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screen4.dart';

class screen5 extends StatefulWidget {
  const screen5({Key key}) : super(key: key);

  @override
  _screen5State createState() => _screen5State();
}

class _screen5State extends State<screen5> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child:
                    GestureDetector(
                  onTap : (){
                    Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => screen4()));
                  },
                      child:Container(
                        child:
                      Icon(Icons.arrow_back_ios,
                        color: Colors.white,


                      ),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20)
                        ),

              ),
    ),

              Center(
                child: Text(
                  "How to win ",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                heightFactor: 1,
                child: Text(
                  "The aim of the game is to steer your boat from A to B without hitting the islands",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => screen5()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.15,
                      height: MediaQuery.of(context).size.height / 12,
                      color: Colors.lightBlueAccent,
                      child: Center(
                        child: Text(
                          "How?",
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
