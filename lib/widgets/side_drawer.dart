import 'package:flutter/material.dart';

import '../pages/filters.dart';

class SideDrawer extends StatelessWidget {
  ListTile drawerListTile(String name, Widget icon, Function onTap) {
    return ListTile(
      leading: icon,
      onTap: onTap,
      title: Text(name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
            padding: EdgeInsets.all(0),
            child: Container(
              height: 250,
              color: Color(0xFFFFB300),
              child: Center(
                  child: Text(
                'Cooking Up!',
                style: TextStyle(fontSize: 40, color: Color(0xFFB71C1c)),
              )),
            )),
        drawerListTile('Meals', Icon(Icons.restaurant), () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        Divider(),
        drawerListTile('Filters', Icon(Icons.settings), () {
          Navigator.of(context).pushReplacementNamed(Filters.namedRoute);
        }),
      ],
    ));
  }
}
