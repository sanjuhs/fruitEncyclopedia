import 'package:flutter/material.dart';

class NutritionDialog extends StatefulWidget {
  Map fruit;

  NutritionDialog({this.fruit});

  @override
  _NutritionDialogState createState() => _NutritionDialogState();
}

class _NutritionDialogState extends State<NutritionDialog> {
  double lineHeight = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    print(size.height);
    print(size.width);

    return SafeArea(
      child: Container(
        width: 0.8 * size.width,
        height: 0.8 * size.height,
        child: ClipPath(
          clipper: DialogClipper(),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black),
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 20, left: 25, right: 0),
                    child: IconButton(
                      alignment: Alignment.topLeft,
                      icon: Icon(
                        Icons.cancel_rounded,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //transform: Matrix4.translationValues(0.0, -25.0, 0.0),
                      //height: 400,
                      decoration: BoxDecoration(
                          // color: Colors.yellow,
                          ),
                      padding: EdgeInsets.only(top: 0, left: 0, right: 0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "Calories : ${widget.fruit['calories']} kcal",
                              //style: TextStyle(height: lineHeight),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              "Carbohydratess : ${widget.fruit['carb']} g",
                              //style: TextStyle(height: lineHeight),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              "Sugar : ${widget.fruit['sugar']} g",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Fiber : ${widget.fruit['fiber']} g",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Fat : ${widget.fruit['fat']} g",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Protein : ${widget.fruit['protein']} g",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Water : ${widget.fruit['water']} g",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Vitamin A : ${widget.fruit['vitA']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Vitamin B1 : ${widget.fruit['vitB1']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Vitabin B2 : ${widget.fruit['vitB2']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Vitamin B3 : ${widget.fruit['vitB3']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Vitamin B5 : ${widget.fruit['vitB5']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Vitamin B6 : ${widget.fruit['vitB6']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Vitamin B7 : ${widget.fruit['vitB7']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Vitamin B9 : ${widget.fruit['vitB9']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Vitamin B12 : ${widget.fruit['vitB12']} mg",
                              //: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Vitamin C : ${widget.fruit['vitC']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Vitamin D : ${widget.fruit['vitD']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Sugar : ${widget.fruit['sugar']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Vitamin E : ${widget.fruit['vitE']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Vitamin K : ${widget.fruit['vitK']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Choline : ${widget.fruit['choline']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Potassium : ${widget.fruit['potassium']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Chlorine : ${widget.fruit['chlorine']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Sodium : ${widget.fruit['sodium']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Calcium : ${widget.fruit['calcium']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Phosphorus : ${widget.fruit['phosphorus']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Magnesium : ${widget.fruit['magnesium']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Iron : ${widget.fruit['iron']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Zinc : ${widget.fruit['zinc']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Manganese : ${widget.fruit['manganese']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Copper : ${widget.fruit['copper']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 15,),
                            Text(
                              "Selenium : ${widget.fruit['selenium']} mg",
                              //style: TextStyle(height: lineHeight),
                            ),SizedBox(height: 125,),
                            //Text("data")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // return Container(
    //   child: Text('suhas'),
    // );
  }
}

class DialogClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // print(size.width);
    var path = Path();
    var y = size.height;
    var x = size.width;
    // print(x);
    // print(y);
    path.moveTo(0.05 * x, 0.03 * y);
    // path.quadraticBezierTo(0*x, 0.60*y, 0.1*x, 0.6*y);

    //path.lineTo(0.9*x, 0.6*y);

    path.lineTo(0.95 * x, 0.03 * y);
    path.lineTo(0.95 * x, 0.90 * y);
    path.lineTo(0.05 * x, 0.90 * y);
    path.close();

    // path.quadraticBezierTo(1*x, 0.6*y, 1*x, 0.64*y);

    // path.lineTo(1*x, 0.76*y);
    // path.quadraticBezierTo(1*x, 0.8*y,0.9*x, 0.8*y);

    // path.lineTo(0.85*x,0.8*y);
    // path.lineTo(0.825*x, 0.9*y);
    // path.lineTo(0.8*x,0.8*y);

    // path.lineTo(0.1*x, 0.8*y);
    // path.quadraticBezierTo(0*x, 0.8*y, 0*x, 0.76*y);

    // path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
