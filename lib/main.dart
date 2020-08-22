import 'package:flutter/material.dart';

import 'models/meal.dart';
import './dummy_data.dart';
import './pages/meal_details.dart';
import './pages/tabBarScreen.dart';
import './pages/category_meals.dart';
import './pages/categories.dart';
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

  void toggleFavorite(String mealId) {
    final existingIndex =
        favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool isFavorite(String id) {
    return (favoriteMeals.any((element) => element.id == id));
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
        '/': (context) => TabBarScreen(favoriteMeals),
        MealDetails.namedRoute: (context) =>
            MealDetails(isFavorite, toggleFavorite),
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
