import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myapp8_fruit_encyclopedia/providers/fruit_info.dart';

class DetailsDialog extends StatefulWidget {
  Map fruit;

  DetailsDialog({this.fruit});

  @override
  _DetailsDialogState createState() => _DetailsDialogState();
}

class _DetailsDialogState extends State<DetailsDialog> {
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
              body: SingleChildScrollView(
                child: Column(
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
                    Container(child:Text(widget.fruit['cmnName'] , style: TextStyle(fontSize: 0.07*size.width ,fontWeight: FontWeight.bold ), )),
                    SizedBox(height: 15,),
                    Divider(height: 0.0001*size.width, thickness: 0.0003*size.width, indent: 70, endIndent: 70, color:  widget.fruit['color1'] ,
                              ),SizedBox(height: 10,),
                    
                    Container(
                      transform: Matrix4.translationValues(0.0, -25.0, 0.0),
                      decoration: BoxDecoration(
                          // color: Colors.yellow,
                          ),
                      padding: EdgeInsets.only(top: 0.1*size.width, left:  0.1*size.width, right:  0.1*size.width ,bottom:  0.3*size.width),
                      child: Text(widget.fruit['description'] , style: TextStyle(fontSize: 0.04*size.width),),
                          ),
                    SizedBox(height: 135,),
                    //Text("data")
                        
                    
                  ],
                ),
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
