import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp8_fruit_encyclopedia/models/fruit.dart';
import 'package:myapp8_fruit_encyclopedia/providers/fruit_info.dart';

class lvl1GridScreenLanding extends StatefulWidget {
  //const lvl1GridScreenLanding({ Key? key }) : super(key: key);

  @override
  _lvl1GridScreenLandingState createState() => _lvl1GridScreenLandingState();
}

class _lvl1GridScreenLandingState extends State<lvl1GridScreenLanding> {
  @override
  Widget build(BuildContext context) {
    final fruitsData = Provider.of<FruitsInfo>(context);
    final fruitsdisplaydata = fruitsData.fruitlist;
    return Scaffold(
      
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.985 ,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          ), 
        itemBuilder: (context , i )=>Container(child: Text(fruitsdisplaydata[i].title), decoration: BoxDecoration(color:fruitsdisplaydata[i].color1 ),),
        itemCount: fruitsdisplaydata.length,
        padding: const EdgeInsets.all(10),
      )
    );
  }
}