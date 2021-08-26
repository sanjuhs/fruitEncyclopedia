import 'package:flutter/material.dart';

import 'lvl1_gridScreenLanding.dart';

class Lv3_WrongAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ListView(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 10, right: 10, top: 35),
            child: Text(
              'Sorry, Wrong Answer !',
              style: TextStyle(fontSize: 28),
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
                child: Text('Go Back to Home Screen')),
          ),
        ],
      ),
    );
  }
}
