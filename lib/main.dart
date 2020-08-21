import 'package:flutter/material.dart';

import 'models/meal.dart';
import './dummy_data.dart';
import './pages/favourites.dart';
import './pages/meal_details.dart';
import './pages/tabBarScreen.dart';
import './pages/category_meals.dart';
import 'pages/categories.dart';
import './pages/filters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    filters = filterData;
    _availableMeals = DUMMY_MEALS.where((element) {
      if (filters['gluten'] && !element.isGlutenFree) {
        return false;
      }
      if (filters['lactose'] && !element.isLactoseFree) {
        return false;
      }
      if (filters['vegan'] && !element.isVegan) {
        return false;
      }
      if (filters['vegetarian'] && !element.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

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
        '/': (context) => TabBarScreen(),
        Favourites.namedRoute: (xontext) => Favourites(),
        MealDetails.namedRoute: (context) => MealDetails(),
        Filters.namedRoute: (context) => Filters(filters, _setFilters),
        CategoryMeals.namedRoute: (context) => CategoryMeals(_availableMeals)
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
