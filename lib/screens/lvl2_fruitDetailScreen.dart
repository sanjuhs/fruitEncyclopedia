// Lv2FruitDetails( int i ){

//   // put your state less or staeful widget here
//   // also use provider 
// }


import "package:flutter/material.dart";

import 'package:provider/provider.dart';
import 'package:myapp8_fruit_encyclopedia/providers/fruit_info.dart';
import 'package:myapp8_fruit_encyclopedia/models/fruit.dart';

import 'dart:math';

class Lv2FruitDetails extends StatefulWidget {
  final int a ;  
  Lv2FruitDetails(this.a);

  @override
  State<StatefulWidget> createState() {
    return _Lv2FruitDetails(id: a);
  }
}

class _Lv2FruitDetails extends State<Lv2FruitDetails> {
  final int id;

  _Lv2FruitDetails({this.id});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final curveHeight = height * 0.6;

    final fruitsData = Provider.of<FruitsInfo>(context);
    final fruitsdisplaydata = fruitsData.fruitlist;

    return ChangeNotifierProvider(
      create: (ctx)=> FruitsInfo(),
          child: Scaffold(
        backgroundColor: fruitsdisplaydata[id].color1,
        body: ListView(
          children: <Widget>[
            CurvedShape(ht: curveHeight , imgUrl:fruitsdisplaydata[id].imgUrl),
            Container(
              child: Text(
                fruitsdisplaydata[id].title,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 40),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text:
                        fruitsdisplaydata[id].description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CurvedShape extends StatelessWidget {
  final double ht;
  final String imgUrl;
  CurvedShape({@required this.ht , @required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ht,
      child: CustomPaint(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(80),
          decoration: BoxDecoration(
            image: DecorationImage(
              image : AssetImage( imgUrl ),
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        painter: _MyPainter(),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = Colors.white;

    final height = size.height;
    final width = size.width;

    Offset circleCenter = Offset(size.width / 2, size.height);

    final arcStartAngle = 200 / 180 * pi;
    final avatarLeftPointX = circleCenter.dx + 0 * cos(arcStartAngle);
    final avatarLeftPointY = circleCenter.dy + 0 * sin(arcStartAngle);
    Offset avatarLeftPoint =
        Offset(avatarLeftPointX, avatarLeftPointY); // the left point of the arc

    final arcEndAngle = -5 / 180 * pi;
    final avatarRightPointX = circleCenter.dx + 0 * cos(arcEndAngle);
    final avatarRightPointY = circleCenter.dy + 0 * sin(arcEndAngle);
    Offset avatarRightPoint = Offset(
        avatarRightPointX, avatarRightPointY); // the right point of the arc

    Path path = Path()
      ..moveTo(width * 0,
          height * 0) // this move isn't required since the start point is (0,0)
      ..lineTo(width * 0, height)
      ..quadraticBezierTo(
          width * 0.05, height * 0.85, width * 0.2, height * 0.85)
      ..lineTo(width * 0.8, height * 0.85)
      ..quadraticBezierTo(width * 0.95, height * 0.85, width * 1, height * 0.7)
      ..lineTo(width * 1, height * 0)
      // ..arcToPoint(avatarRightPoint, radius: Radius.circular(0))
      // ..quadraticBezierTo(rightCurveControlPoint.dx, rightCurveControlPoint.dy,
      //     bottomRight.dx, bottomRight.dy)
      // ..lineTo(topRight.dx, topRight.dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}