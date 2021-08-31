import 'package:flutter/material.dart';


class screen2 extends StatefulWidget {
  const screen2({Key key}) : super(key: key);

  @override
  _screen2State createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/screen1.jpg"),
            fit: BoxFit.cover,
          )

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                  child: InkWell(
                    child: Icon(Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 40,
                    ),
                    onTap: (){
                      Navigator.pop(context,
                          MaterialPageRoute(
                            builder: (context) => screen2(),
                          )
                      );
                    },
                  ),
                )

              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text("For the history buff in you ...",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )

              ],
            )

          ],
        ),
      ),
    );
  }
}
