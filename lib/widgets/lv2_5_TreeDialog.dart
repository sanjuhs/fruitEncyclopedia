import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myapp8_fruit_encyclopedia/providers/fruit_info.dart';

class TreeDialog extends StatefulWidget {
  Map fruit;

  TreeDialog({this.fruit});

  @override
  _TreeDialogState createState() => _TreeDialogState();
}

class _TreeDialogState extends State<TreeDialog> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    print(size.height);
    print(size.width);

    return Container(
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
                  padding: EdgeInsets.only(top: 15, left: 10, right: 5),
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
                Container(
                  transform: Matrix4.translationValues(0.0, -70.0, 0.0),
                  width: double.infinity,
                  height: 0.6*size.height,
                  child: CustomPaint(
                      child: Container(
                    transform: Matrix4.translationValues(0.0, 80.0, 0.0),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.fruit['treeURL']),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  )),
                ),
              ],
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