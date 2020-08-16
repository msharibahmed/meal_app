import 'package:flutter/material.dart';

import '../widgets/grid_view_category.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/side_drawer.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideDrawer(),
        bottomNavigationBar: BottomNavbar(),
        appBar: AppBar(
          title: Text('My Meal'),
        ),
        body: GridViewCategory());
  }
}
