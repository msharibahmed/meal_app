import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meals_detail_card.dart';

class MealDetails extends StatelessWidget {
  static const namedRoute = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    final String title = routeArgs['title'];
    final String imageUrl = routeArgs['imageUrl'];
    final List ingredients = routeArgs['ingredients'];
    final List steps = routeArgs['steps'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: MealsDetailCard(imageUrl, ingredients, steps),
    );
  }
}
