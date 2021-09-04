import 'package:flutter/material.dart';

import 'lvl1_gridScreenLanding.dart';

class Lv3_WrongAnswer extends StatelessWidget {
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
              'Sorry, Wrong Answer !',
              style: TextStyle(fontSize: 0.07 * size.width),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 50),
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
                backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
