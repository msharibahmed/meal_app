import 'package:flutter/material.dart';
import 'package:meal_app/pages/favourites.dart';
import 'package:meal_app/pages/meal_details.dart';

import './pages/category_meals.dart';
import 'pages/categories.dart';
import './pages/filters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline6: TextStyle(
                fontSize: 20.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Categories(),
        Favourites.namedRoute: (xontext) => Favourites(),
        MealDetails.namedRoute: (context) => MealDetails(),
        Filters.namedRoute: (context) => Filters(),
        CategoryMeals.namedRoute: (context) => CategoryMeals()
      },
      // onGenerateRoute: (RouteSettings settings) {
      //   print(settings.arguments);
      //    if (settings.name == '/meals-details') {
      //      return MaterialPageRoute(builder: (context) => Categories());
      //    }
      //    return MaterialPageRoute(builder: (context) => Categories());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => Categories());
      },
    );
  }
}
