import 'package:flutter/material.dart';
import 'package:meal_app/widgets/recipie_card.dart';

import '../models/meal.dart';

class Favourites extends StatelessWidget {
  static const namedRoute = '/favourites';
  final List<Meal> favoriteMeal;
  Favourites(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Meals'),
      ),
      body: FavouriteList(favoriteMeal),
    );
  }
}

class FavouriteList extends StatelessWidget {
  final List<Meal> favoriteMeal;
  FavouriteList(this.favoriteMeal);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(child: Text('No favorites added'));
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return RecipieCard(
            id: favoriteMeal[index].id,
            title: favoriteMeal[index].title,
            imageUrl: favoriteMeal[index].imageUrl,
            duration: favoriteMeal[index].duration,
            affordability: favoriteMeal[index].affordability,
            complexity: favoriteMeal[index].complexity,
            categories: favoriteMeal[index].categories,
            ingredients: favoriteMeal[index].ingredients,
            steps: favoriteMeal[index].steps,
            // removeRecipeItem: removeRecipeMethod,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
