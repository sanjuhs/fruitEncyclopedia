import 'package:flutter/material.dart';
import 'package:myapp8_fruit_encyclopedia/screens/lvl1_gridScreenLanding.dart';

class Lv3_CorrectAnswer extends StatelessWidget {
  String stickerURL;

  Lv3_CorrectAnswer({this.stickerURL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ListView(
        children: [
          Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10, top: 35),
              child: Text(
                'Right Answer, here\'s your reward !',
                style: TextStyle(fontSize: 28),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(stickerURL),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 50),
              child: ElevatedButton(onPressed: (){
                 Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => lvl1GridScreenLanding(
                        ),
                      ),
                    );
              }, child: Text('Go Back to Home Screen')),
            ),
        ],
      ),
    );
  }
}