import 'package:flutter/material.dart';

import '../widgets/recipie_card.dart';
import '../models/meal.dart';

class CategoryMeals extends StatefulWidget {
  static const String namedRoute = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMeals(this.availableMeals);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  List<Meal> categoryMeals;
  String title;
  var _loadInitData = false;

  // @override
  // void initState() {
  //   super.initState();
  // }

  void removeRecipeMethod(String mealId) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = routeArgs['title'];
      final String id = routeArgs['id'];
      categoryMeals = widget.availableMeals.where((element) {
        return element.categories.contains(id);
      }).toList();
      _loadInitData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            floating: true,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
                fit: BoxFit.cover,
              ),
              title: Container(
                  width: double.infinity,
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title,
                        style: TextStyle(fontFamily: 'RobotoCondensed')),
                  )),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return RecipieCard(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity,
                categories: categoryMeals[index].categories,
                ingredients: categoryMeals[index].ingredients,
                steps: categoryMeals[index].steps,
                // removeRecipeItem: removeRecipeMethod,
              );
            },
            childCount: categoryMeals.length,
          ))
        ],
      ),
    );
  }
}

// appBar: AppBar(
//   title: Text(title),
// ),
// body: ListView.builder(
//   itemBuilder: (context, index) {
//     return RecipieCard(
//         id: categoryMeals[index].id,
//         title: categoryMeals[index].title,
//         imageUrl: categoryMeals[index].imageUrl,
//         duration: categoryMeals[index].duration,
//         affordability: categoryMeals[index].affordability,
//         complexity: categoryMeals[index].complexity,
//         categories: categoryMeals[index].categories,
//         ingredients: categoryMeals[index].ingredients,
//         steps: categoryMeals[index].steps);
//   },
//   itemCount: categoryMeals.length,
// )
//  SliverFillRemaining(
//     child: ListView.builder(
//    itemBuilder: (context, index) {
//      return RecipieCard(
//          id: categoryMeals[index].id,
//          title: categoryMeals[index].title,
//          imageUrl: categoryMeals[index].imageUrl,
//          duration: categoryMeals[index].duration,
//          affordability: categoryMeals[index].affordability,
//          complexity: categoryMeals[index].complexity,
//          categories: categoryMeals[index].categories,
//          ingredients: categoryMeals[index].ingredients,
//          steps: categoryMeals[index].steps);
//    },
//    itemCount: categoryMeals.length,
//  )
//   )
