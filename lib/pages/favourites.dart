
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Meals'),
      ),
      body: FavouriteList(),
    );
  }
}

class FavouriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(child: Text('Add Your Favourite Meal')),
    );
  }
}
