import 'package:flutter/material.dart';

import '../dummy_data.dart';
import './category_item.dart';

class GridViewCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: DUMMY_DATA
          .map((catData) =>
              CategoryItem(catData.id, catData.title, catData.color))
          .toList(),
    );
  }
}
