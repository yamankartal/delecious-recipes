import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constant.dart';

class Category{
  final String image;
  final Color color;
  final String name;

  Category(this.image, this.color, this.name);
}

List<Category>categories=[
  Category('assets/images/category/burger.jpg',Colors.deepOrange.shade900, 'Burger'),
  Category('assets/images/category/chicken.jpg',Colors.red.shade700, 'chicken'),
  Category('assets/images/category/croissant.jpg',Colors.brown.shade900,   'Croissant',),
  Category('assets/images/category/fish.jpg',Colors.amber.shade500, 'fish'),
  Category('assets/images/category/fruit salad.jpg',Colors.orange.shade900, 'fruit salad'),
  Category('assets/images/category/italian.jpg',Colors.red.shade700, 'italian'),
  Category('assets/images/category/juice.jpg',Colors.orange.shade700, 'juice'),
  Category('assets/images/category/pancake.jpg',Colors.amber.shade500, 'pancake'),
  Category('assets/images/category/pizza.jpg',Colors.deepOrange.shade900, 'pizza'),
  Category('assets/images/category/spaghetti.jpg',Colors.deepOrange.shade900, 'spaghetti'),
  Category('assets/images/category/sweets.jpg',Colors.pink.shade400, 'sweets'),
  Category('assets/images/category/vegetables salad.jpg',Colors.green.shade900, 'vegetables'),
];







