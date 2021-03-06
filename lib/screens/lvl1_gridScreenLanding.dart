import 'package:flutter/material.dart';
import 'package:myapp8_fruit_encyclopedia/widgets/lv1_5_FilterDialog.dart';
import 'package:myapp8_fruit_encyclopedia/widgets/lvl1_5_gridCard.dart';
import 'package:provider/provider.dart';

import 'package:myapp8_fruit_encyclopedia/providers/fruit_info.dart';
import 'package:myapp8_fruit_encyclopedia/widgets/lv1_5_navigationBar.dart';

import 'dart:math';

class lvl1GridScreenLanding extends StatefulWidget {
  //const lvl1GridScreenLanding({ Key? key }) : super(key: key);

  @override
  _lvl1GridScreenLandingState createState() => _lvl1GridScreenLandingState();
}

class _lvl1GridScreenLandingState extends State<lvl1GridScreenLanding>
    with SingleTickerProviderStateMixin {
  //animation state
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    //Creating animation controllers
    _animationController = AnimationController(
      //Default initial value
      value: 0.0,
      //execution time
      duration: Duration(seconds: 10),
      //Value range
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    );
    //Repeat execution
    _animationController.repeat();
  }

  ///Building AnimatedBuilder and clipping water ripple
  ///
  AnimatedBuilder buildFirstAnimation(Size size) {
    return AnimatedBuilder(
      //Bind animation controller
      animation: _animationController,
      builder: (BuildContext context, Widget child) {
        //Crop component
        return ClipPath(
          //Custom clipping path
          clipper: HeaderClipper(_animationController.value),
          //Cropped child Widget
          child: Container(
            //height
            height: size.height * 0.2,
            //The style of a linear gradient color
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  //Direction of linear gradient
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xFFE0647B), Color(0xFFFCDD89)]),
            ),
          ),
        );
      },
    );
  }

  ///Code listing 8-31 top aligned text
  ///
  Positioned buildTopText(Size size) {
    return Positioned(
      top: size.height * 0.05,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Text(
            "Fruit pedia",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 0.06*size.width, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "A Comprehensive Fruit Guide ",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 0.03*size.width,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    //Destruction
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var fruitsData = Provider.of<FruitsInfo>(context);
    var fruitsdisplaydata = fruitsData.fruitsListNew;

    void _sortFruitsTrigger(bool alphabetically) {
      print('got the trigger');

      setState(() {
        fruitsData.sortFruits(alphabetically);
      });
    }

    void _runFilter(keyword) {
      if (keyword.isEmpty) {
        setState(() {
          fruitsData.searchFruitsProvider('');

          //fruitsdisplaydata = fruitsData.fruitsListNew;
          //fruitsData.searchFruitsProvider(keyword);

        });
      } else {
        setState(() {
          fruitsData.searchFruitsProvider(keyword);
        });
      }
    }

    void _loadAll() {
      fruitsData.searchFruitsProvider('');
    }


    void showDialogBoxFilter() async {
      var data = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ChangeNotifierProvider(
              create: (ctx) => FruitsInfo(),
              child: FilterDialog(
                sortHandler: _sortFruitsTrigger,
                searchHandler: _runFilter,
                resetHandler: _loadAll,
              ),
            );
          });
      print(data);
      setState((){
         fruitsData.searchFruitsProvider(data);
      });
     
    }

    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ListView(
              // shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 100),
              children: [
                Stack(
                  children: [
                    buildFirstAnimation(size),
                    buildTopText(size),
                  ],
                ),

                // padding: const EdgeInsets.all(0),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.75,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, i) => GridCard(
                      fruitsdisplaydata[i]['cmnName'],
                      fruitsdisplaydata[i]['imgUrl'],
                      fruitsdisplaydata[i]['id'],
                      fruitsdisplaydata[i]['color1']),
                  // Container(
                  //   child: Text(fruitsdisplaydata[i].title),
                  //   decoration: BoxDecoration(color:fruitsdisplaydata[i].color2 ),),
                  //need to add widget above
                  itemCount: fruitsdisplaydata.length,
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 0, bottom: 10.0),
                  // padding: const EdgeInsets.all(0),
                ),
              ],
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: BottomNavbar(
                showDialogBox: () {
                  showDialogBoxFilter();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///Code listing 8-34 custom Clipper
///
class HeaderClipper extends CustomClipper<Path> {
  ///The value is - 1 ~ 1.0
  double moveFlag = 0;

  HeaderClipper(this.moveFlag);

  @override
  Path getClip(Size size) {
    //Create Path
    Path path = Path();
    //Move to point P0, which is also the starting point of the curve
    path.lineTo(0, size.height * 0.8);
    //Calculate the coordinates of control point P1
    double xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * sin(moveFlag * pi);
    double yCenter = size.height * 0.8 + 39 * cos(moveFlag * pi);
    //Construction of second order Bessel curve
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    //Refresh
    return true;
  }
}
