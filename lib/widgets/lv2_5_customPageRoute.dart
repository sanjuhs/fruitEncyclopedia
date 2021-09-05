import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final bool rightToLeft;

  CustomPageRoute({this.child, this.rightToLeft})
      : super(
          transitionDuration: Duration(milliseconds: 400),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) => this.rightToLeft ?
      SlideTransition(
          position: Tween<Offset>(
            //start from -100% on the x co-ordinate
            begin: Offset(1,0),
            end: Offset.zero,
          ).animate(animation), child: child) :
          SlideTransition(
          position: Tween<Offset>(
            //start from -100% on the x co-ordinate
            begin: Offset(-1,0),
            end: Offset.zero,
          ).animate(animation), child: child);
}
