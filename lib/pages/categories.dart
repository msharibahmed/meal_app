import 'package:flutter/material.dart';

import '../category_item.dart';
import '../dummy_data.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final screens = ['/', 'favourites'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
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
            const ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Filters',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            )
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Category')),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), title: Text('Favourites'))
          ],
          currentIndex: 0,
        ),
        appBar: AppBar(
          title: Text('My Meal'),
        ),
        body: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          children: DUMMY_DATA
              .map((catData) => CategoryItem(catData.title, catData.color))
              .toList(),
        ));
  }
}
