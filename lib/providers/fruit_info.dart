import 'package:flutter/material.dart';
import 'package:myapp8_fruit_encyclopedia/models/fruit.dart';

class FruitsInfo with ChangeNotifier{
  List<Fruit> _fruitList=[
    Fruit(
      id:'p1',
      title:'Banana',
      description:'''This is an apple description of the century This is an apple description of the century 
       This is an apple description of the century This is an apple description of the century This is an apple description of the
        century This is an apple description of the century This is an apple description of the century This is an apple description 
        of the century This is an apple description of the century This is an apple description of the century 
       This is an apple description of the century This is an apple description of the century This is an apple description of the
        century This is an apple description of the century This is an apple description of the century This is an apple description 
        of the centuryThis is an apple description of the century This is an apple description of the century 
       This is an apple description of the century This is an apple description of the century This is an apple description of the
        century This is an apple description of the century This is an apple description of the century This is an apple description 
        of the century''',
      color1:Colors.yellow[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/3_1_banana.webp',
    ),
    Fruit(
      id:'p2',
      title:' Green Apple',
      description:'This is an apple description of the century ',
      color1:Colors.lightGreen[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/1_2_greenapple.png',
    ),
    Fruit(
      id:'p3',
      title:'Apple3',
      description:'This is an apple description of the century ',
      color1:Colors.red[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/1_2_greenapple.png',
    ),
    Fruit(
      id:'p4',
      title:'Apple4',
      description:'This is an apple description of the century ',
      color1:Colors.redAccent[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/1_2_greenapple.png',
    ),
  ];


  List<Fruit> get fruitlist  {return [..._fruitList];}
  List<Fruit> get fruitlistmodify1  {return _fruitList;}

}