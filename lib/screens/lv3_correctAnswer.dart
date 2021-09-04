import 'package:flutter/material.dart';
import 'package:myapp8_fruit_encyclopedia/screens/lv2_quiz.dart';
import 'package:myapp8_fruit_encyclopedia/screens/lvl1_gridScreenLanding.dart';

class Lv3_CorrectAnswer extends StatelessWidget {
  String stickerURL;

  Lv3_CorrectAnswer({this.stickerURL});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 10, right: 10, top: 35),
            child: Text(
              'Right Answer, here\'s your reward !',
              style: TextStyle(fontSize: 0.04 * size.width),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: double.infinity,
            height: 0.5 * size.height,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/' + stickerURL),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.1*size.width, left: 0.1*size.width, right: 0.1*size.width, bottom: 0.01*size.width),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => lvl1GridScreenLanding(),
                  ),
                );
              },
              child: Text(
                'Go Back to Home Screen',
                style: TextStyle(
                  fontSize: 0.05 * size.width,
                ),
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.all(0.01 * size.width),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.1*size.width, left: 0.1*size.width, right: 0.1*size.width, bottom: 0.1*size.width),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Lv2_Quiz(),
                  ),
                );
              },
              child: Text(
                'Attempt the Next Question',
                style: TextStyle(
                  fontSize: 0.05 * size.width,
                ),
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.all(0.01 * size.width),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue)),
            ),
          ),
        ],
      ),
    );
  }
}
