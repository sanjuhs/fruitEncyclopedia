import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Fruit {
  final String id;
  final String title;
  final String description;
  final Color color1;
  final Color color2;
  final String imgUrl;
  final List<int> tags;
  //bool isFavorite;

  Fruit(
      {
      @required this.id,
      @required this.title,
      @required this.description,
      @required this.color1,
      @required this.color2,
      this.tags,
      @required this.imgUrl
      //this.isFavorite= false
      });
}