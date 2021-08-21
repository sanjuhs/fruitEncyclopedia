import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myapp8_fruit_encyclopedia/providers/favourites.dart';

class Lv2FavouritesScreen extends StatefulWidget {
  @override
  _Lv2FavouritesScreenState createState() => _Lv2FavouritesScreenState();
}

class _Lv2FavouritesScreenState extends State<Lv2FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    var favouriteFruits = Provider.of<Favourites>(context);
    var favouriteFruitsList = favouriteFruits.favouriteFruitsListProvider;
    
    return Scaffold(
      body: ListView(children: [
        Text('Favourites'),
      ],),
      
    );
  }
}