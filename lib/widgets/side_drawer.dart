
import 'package:flutter/material.dart';
import 'package:meal_app/pages/filters.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
            padding: EdgeInsets.all(0),
            child: Container(
              color: Color(0xFFFFB300),
              child: Center(
                  child: Text(
                'Cooking Up!',
                style: TextStyle(fontSize: 40, color: Color(0xFFB71C1c)),
              )),
            )),
        ListTile(
          leading: Icon(Icons.markunread_mailbox),
          title: Text('Meals',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        ),
        Divider(
          height: 0,
        ),
         ListTile(
          onTap: ()=>drawerListFilterTap(context),
          leading: const Icon(Icons.settings),
          title: const Text('Filters',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        )
      ],
    ));
  }
  void drawerListFilterTap(BuildContext context){
    
            Navigator.of(context).pushNamed(Filters.namedRoute);
  }
}
