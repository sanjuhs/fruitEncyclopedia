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
  final int a;
  Lv2FruitDetails(this.a);

  @override
  State<StatefulWidget> createState() {
    return _Lv2FruitDetails(id: a);
  }
}

class _Lv2FruitDetails extends State<Lv2FruitDetails> {
  int id;

  _Lv2FruitDetails({this.id});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final Size size = MediaQuery.of(context).size;
    final curveHeight = height * 0.6;

    final fruitsData = Provider.of<FruitsInfo>(context);
    final fruitsdisplaydata = fruitsData.fruitlist;

    return ChangeNotifierProvider(
      create: (ctx) => FruitsInfo(),
      child: Scaffold(
        backgroundColor: fruitsdisplaydata[id].color1,
        body: Stack(
          children: [
            ListView(
              children: <Widget>[
                CurvedShape(
                    ht: curveHeight, imgUrl: fruitsdisplaydata[id].imgUrl),
                Container(
                  //transform here is to move the title upwards
                  transform: Matrix4.translationValues(0.0, -20.0, 0.0),
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
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 40),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: fruitsdisplaydata[id].description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: 80,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: BNBCustomPainter(),
                    ),
                    Container(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            disabledColor: Colors.green,
                            icon: Icon(
                              Icons.arrow_back,
                              size: 32.0,
                            ),
                            onPressed: () {
                              if(id == 0){
                                return null;
                              }
                              setState(() {
                                id = id - 1;
                              });    
                            }
                          ),
                          IconButton(
                            disabledColor: Colors.grey,
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 32.0,
                            ),
                            onPressed: () {
                              if(id == fruitsdisplaydata.length-1){
                                return null;
                              }
                              setState((){
                                id = id + 1;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
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
  CurvedShape({@required this.ht, @required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  splashColor: Colors.grey,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                  iconSize: 28,
                ),
              ],
            ),
          ),
        Container(
          width: double.infinity,
          height: ht,
          child: CustomPaint(
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(80),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgUrl),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            painter: _MyPainter(),
          ),
        ),
      ],
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

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(10.0), clockwise: false);
    // path.lineTo(size.width*0.60, size.height);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
