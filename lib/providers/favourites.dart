import 'package:flutter/material.dart';

class Favourites with ChangeNotifier {
  List<Map<String, dynamic>> _favouriteFruits = [{
      'id': '1',
      'cmnName': 'Apple',
      'scfName': 'Malus domestica',
      'color1': Colors.red[100],
      'slDescription': 'this is an apple',
      'description': 'detailed description of the apple fruit',
      'imgUrl': 'images/2_01_apple.webp',
      'calories': 52,
      'carb': 13.81,
      'sugar': 10.39,
      'fiber': 2.4,
      'fat': 0.17,
      'protein': 0.26,
      'water': 85.56,
      'vitA': 0.003,
      'vitB1': 0.017,
      'vitB2': 0.026,
      'vitB3': 0.091,
      'vitB5': 0.061,
      'vitB6': 0.041,
      'vitB7': 0,
      'vitB9': 0.03,
      'vitB12': 0,
      'vitC': 4.6,
      'vitD': 0,
      'vitE': 0.18,
      'vitK': 0.0022,
      'choline': 0,
      'potassium': 107,
      'chlorine': 0,
      'sodium': 1,
      'calcium': 6,
      'phosphorus': 11,
      'magnesium': 5,
      'iron': 0.12,
      'zinc': 0.04,
      'manganese': 0.035,
      'copper': 0,
      'selenium': 0,
    },];

  List<Map<String, dynamic>> get favouriteFruitsListProvider {
    return [..._favouriteFruits];
  }

  void addFavourite(Map newFruit){
    _favouriteFruits.add(newFruit);
  }
}
