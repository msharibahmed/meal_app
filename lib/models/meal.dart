import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }
enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;

  final int duration;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;

  final bool isGlutenFree;
  final bool isVegan;
  final bool isLactoseFree;
  final bool isVegetarian;

  const Meal(
      {@required this.id,
      @required this.title,
      @required this.categories,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.imageUrl,
      @required this.complexity,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian});
}
