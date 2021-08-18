import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // return ClipPath(
    //   clipper: DialogClipper(),
    //   child: Container(
    //     height: 40,
    //     child: Text('this is asuhas'),
    //   ),
    // );
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      // child:  ClipPath(
      //   clipper: DialogClipper(),
      //   child: Container(
      //     width: size.width,
      //     height: size.height,
      //     decoration: BoxDecoration(color: Colors.yellow),
      //     child: Text('this is asuhas'),
      //   ),
      // ),
    );
    // return Container(
    //   child: Text('suhas'),
    // );
  }
}

class DialogClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    print(size.width);
    var path = Path();
    var y = size.height;
    var x = size.width;
    print(x);
    print(y);
    path.moveTo(0*x, 0.64*y);
    path.quadraticBezierTo(0*x, 0.60*y, 0.1*x, 0.6*y);
    path.lineTo(0.9*x, 0.6*y);
    path.quadraticBezierTo(1*x, 0.6*y, 1*x, 0.64*y);
    path.lineTo(1*x, 0.76*y);
    path.quadraticBezierTo(1*x, 0.8*y,0.9*x, 0.8*y);
    path.lineTo(0.85*x,0.8*y);
    path.lineTo(0.825*x, 0.9*y);
  return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
