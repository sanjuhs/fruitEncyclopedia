import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myapp8_fruit_encyclopedia/providers/fruit_info.dart';

class FilterDialog extends StatefulWidget {
  Function sortHandler, searchHandler, resetHandler;
  FilterDialog({this.sortHandler, this.searchHandler, this.resetHandler});

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var fruitsData = Provider.of<FruitsInfo>(context);
    //var fruitsdisplaydata = fruitsData.fruitsListNew;

    var searchString = fruitsData.getSearchString;

    print('rebuilding filter dialog');
    print(searchString);
    print("hello world");
    TextEditingController _controller1 = TextEditingController();
    _controller1.text = searchString;

    return  Container(
        margin: EdgeInsets.only(top: 0.3 * size.height),
        child: Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: ClipPath(
            clipper: DialogClipper(),
            child: Container(
              width: size.width,
              height: 0.3 * size.height,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    height: 20,
                    child: IconButton(
                      alignment: Alignment.topRight,
                      icon: Icon(
                        Icons.cancel_rounded,
                      ),
                      onPressed: () {
                        Navigator.pop(context,_controller1.text);
                      },
                    ),
                  ),

                
                

                  Text('Sort By Alphabet:'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            // Provider.of<FruitsInfo>(context).sortFruits(true);
                            widget.sortHandler(true);
                          },
                          child: Text('A-Z')),
                      ElevatedButton(
                          onPressed: () {
                            widget.sortHandler(false);
                          },
                          child: Text('Z-A')),
                    ],
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
    path.moveTo(0 * x, 0 * y);
    // path.quadraticBezierTo(0*x, 0.60*y, 0.1*x, 0.6*y);

    //path.lineTo(0.9*x, 0.6*y);

    path.lineTo(0 * x, 1 * y);
    path.lineTo(1 * x, 1 * y);
    path.lineTo(1 * x, 0 * y);
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
