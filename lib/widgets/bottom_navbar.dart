import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  void _bottomNavbarOntap(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
            title:
                Text('Favourites', style: TextStyle(color: Colors.amber[200])))
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
        _bottomNavbarOntap(index);
      },
    );
  }
}
