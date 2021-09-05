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
                    padding: EdgeInsets.only(top: 0.06*size.width, left: 0.06*size.width, right: 0),
                    child: IconButton(
                      alignment: Alignment.topLeft,
                      icon: Icon(
                        Icons.cancel_rounded,
                        size: 0.05*size.width,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text(
                    " ${widget.fruit['cmnName']}  Plant/Tree ",
                    style: TextStyle(
                        fontSize: 0.07 * size.width,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                    thickness: 3,
                    indent: 70,
                    endIndent: 70,
                    color: widget.fruit['color1'],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/' + widget.fruit['treeURL'],
                      fit: BoxFit.cover,
                    ),
                    padding: EdgeInsets.all(0.03*size.width),
                  ),
                  // Container(
                  //   transform: Matrix4.translationValues(0.0, -70.0, 0.0),
                  //   width: double.infinity,
                  //   height: 0.6 * size.height,
                  //   child: CustomPaint(
                  //     child: Column(
                  //       children: [
                  //         Text("data"),
                  //         Image.asset('assets/images/'+widget.fruit['treeURL']),
                  //         Expanded( child: Image.asset( 'assets/images/'+widget.fruit['treeURL'], fit: BoxFit.cover,) ,),
                  //         // Container(
                  //         //   // width: double.infinity,
                  //         //   // height: double.,
                  //         //   transform: Matrix4.translationValues(0.0, 80.0, 0.0),
                  //         //   padding: EdgeInsets.all(20),
                  //         //   margin: EdgeInsets.all(10),
                  //         //   decoration: BoxDecoration(
                  //         //     image: DecorationImage(
                  //         //       image: AssetImage('assets/images/'+widget.fruit['treeURL']),
                  //         //       fit: BoxFit.fill,
                  //         //     ),
                  //         //   ),
                  //         // ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
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
