import 'package:flutter/material.dart';
import 'package:myapp8_fruit_encyclopedia/screens/lv2_favourites.dart';
import 'package:myapp8_fruit_encyclopedia/screens/lv2_stickers.dart';
import 'package:myapp8_fruit_encyclopedia/screens/lvl1_gridScreenLanding.dart';
import 'package:myapp8_fruit_encyclopedia/widgets/lv1_5_FilterDialog.dart';

class BottomNavbar extends StatelessWidget {
  Function showDialogBox;

  BottomNavbar({this.showDialogBox});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: 80,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            CustomPaint(
              size: Size(size.width, 80),
              painter: BNBCustomPainter(),
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lv2FavouritesScreen(),
                        ),
                      );
                    },
                    splashColor: Colors.white,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.home_outlined,
                        color: Colors.grey.shade400,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => lvl1GridScreenLanding(),
                        ),
                      );
                      },),
                  Container(
                    width: size.width * 0.20,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.filter_list_outlined,
                        color: Colors.grey.shade400,
                      ),
                      onPressed: () {
                        this.showDialogBox();
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.emoji_events_outlined,
                        color: Colors.grey.shade400,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lv2StickersScreen(),
                        ),
                      );
                      }),
                ],
              ),
            )
          ],
        ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
