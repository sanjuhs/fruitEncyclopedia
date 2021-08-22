import 'dart:convert';

import "package:flutter/material.dart";
import 'package:myapp8_fruit_encyclopedia/widgets/lv2_5_NutritionDialog.dart';

import 'package:provider/provider.dart';
import 'package:myapp8_fruit_encyclopedia/providers/fruit_info.dart';

import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

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
  List<String> favListJSON = [];
  List<String> idsList = [];
  List<Map<String, dynamic>> favListFinal = [];
  SharedPreferences sharedPreferences;

  _Lv2FruitDetails({this.id});

  @override
  void initState() {
    // initiSharedPreferences();
    // SharedPreferences.setMockInitialValues({
    //   "favourites" : ['1']
    // });

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      loadData();
    });
    super.initState();
  }

  initiSharedPreferences() {
    // SharedPreferences.setMockInitialValues({
    //   "favourites" : ['1']
    // });
  }

  void loadData() {
    // favListJSON = sharedPreferences.getStringList('favourites');
    // if (favListJSON != null) {
    //   favListJSON.forEach((element) {
    //     Map<String, dynamic> fav = jsonDecode(element);
    //     favListFinal.add(fav);
    //   });
    // }
    // print(favListFinal);
    if (sharedPreferences != null) {
      List <String> df;
      df = sharedPreferences.getStringList('favourites');
      if(df.length!=0){
        print("sd !");
        idsList =df;
      }
      print("id list to be shown below :");
      print(idsList);
      print("df below");
      print(df);
      print("XXXXX");
    }
  }

  void storeData(String id) {
    print("adding below");
    idsList.add(id);
    print("hopefully no error above");
    // print(idsList);
    sharedPreferences.setStringList('favourites', idsList);
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final Size size = MediaQuery.of(context).size;
    final curveHeight = height * 0.6;

    final fruitsData = Provider.of<FruitsInfo>(context);
    final fruitsdisplaydata = fruitsData.fruitsListNew;

    return ChangeNotifierProvider(
      create: (ctx) => FruitsInfo(),
      child: Scaffold(
        backgroundColor: Colors.white, //fruitsdisplaydata[id].color1,
        body: Stack(
          children: [
            ListView(
              children: <Widget>[
                CurvedShape(
                  ht: curveHeight,
                  imgUrl: fruitsdisplaydata[id]['imgUrl'],
                  color: fruitsdisplaydata[id]['color1'],
                ),
                Container(
                  //transform here is to move the title upwards
                  transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                  child: Text(
                    fruitsdisplaydata[id]['cmnName'],
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
                        text: fruitsdisplaydata[id]['description'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                )
              ],
            ),
            //the navigation bar
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
                      painter: BNBCustomPainter(
                        // color: fruitsdisplaydata[id]['color1']
                        color: Colors.white,
                      ),
                    ),
                    Center(
                      heightFactor: 0.6,
                      child: FloatingActionButton(
                          backgroundColor: Colors.orange,
                          child: Icon(Icons.quiz_sharp),
                          elevation: 0.1,
                          onPressed: () {}),
                    ),
                    Container(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.star_border_outlined,
                              color: Colors.grey.shade400,
                            ),
                            onPressed: () {
                              storeData(fruitsdisplaydata[id]['id']);
                            },
                            splashColor: Colors.white,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.health_and_safety_outlined,
                              color: Colors.grey.shade400,
                            ),
                            onPressed: (){
                              NutritionDialog(fruit : fruitsdisplaydata[id]);
                            },
                          ),
                          Container(
                            width: size.width * 0.20,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.description_outlined,
                                color: Colors.grey.shade400,
                              ),
                              onPressed: null),
                          IconButton(
                              icon: Icon(
                                Icons.photo_camera_back_outlined,
                                color: Colors.grey.shade400,
                              ),
                              onPressed: null),
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
  final Color color;
  CurvedShape({@required this.ht, @required this.imgUrl, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          transform: Matrix4.translationValues(0.0, -70.0, 0.0),
          width: double.infinity,
          height: ht,
          child: CustomPaint(
            child: Container(
              transform: Matrix4.translationValues(0.0, 80.0, 0.0),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/' + imgUrl),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            painter: _MyPainter(color: color),
          ),
        ),
        Container(
          width: double.infinity,
          //color: Colors.white,
          child: Row(
            children: [
              IconButton(
                splashColor: Colors.grey,
                onPressed: () {
                  // Navigator.pop(context);

                  //since we have added navigator.push for page transitions, we need to pop all
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                icon: Icon(Icons.arrow_back_ios),
                iconSize: 28,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MyPainter extends CustomPainter {
  final Color color;

  _MyPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = color;

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
  final Color color;

  BNBCustomPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
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
