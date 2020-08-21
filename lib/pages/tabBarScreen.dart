import 'package:flutter/material.dart';

import './favourites.dart';
import './categories.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedIndex = 0;
  void _bottomNavbarOntap(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List screens = [Categories(), Favourites()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              icon: Icon(
                Icons.home,
                color: Colors.amber,
              ),
              title: Text(
                'Category',
                style: TextStyle(color: Colors.amber[200]),
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.star,
                color: Colors.amber,
              ),
              title: Text('Favourites',
                  style: TextStyle(color: Colors.amber[200])))
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _bottomNavbarOntap(index);
        },
      ),
      body: screens[_selectedIndex],
    );
  }
}
