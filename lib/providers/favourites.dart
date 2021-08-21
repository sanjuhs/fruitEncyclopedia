import 'package:flutter/material.dart';

class Favourites with ChangeNotifier {
  List<Map<String, dynamic>> _favouriteFruits = [];

  List<Map<String, dynamic>> get favouriteFruitsListProvider {
    return [..._favouriteFruits];
  }
}
