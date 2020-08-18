import 'package:flutter/material.dart';

class MealsDetailCard extends StatelessWidget {
  final String imageUrl;
  final List ingredients;
  final List steps;
  MealsDetailCard(this.imageUrl, this.ingredients, this.steps);
  Padding mealDetailsPaddingBuild(String name) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
          child: Text(
        name,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }

  Container mealDetailsListBuild(double width, Widget child) {
    return Container(
      decoration: BoxDecoration(border: Border.all(), color: Colors.black12),
      height: 175,
      width: width,
      child: Card(elevation: 5, child: child),
      margin: EdgeInsets.only(bottom: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            height: 200,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            )),
        mealDetailsPaddingBuild('Ingredients'),
        mealDetailsListBuild(
          200,
          ListView.builder(
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              return Card(
                  elevation: 10,
                  shadowColor: Colors.amber,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(), color: Colors.amberAccent),
                    child: Text('${index + 1}.\t' + ingredients[index],
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoCondensed')),
                  ));
            },
          ),
        ),
        mealDetailsPaddingBuild('Steps'),
        mealDetailsListBuild(
          320,
          ListView.builder(
            itemCount: steps.length,
            itemBuilder: (context, index) {
              return Column(
                              children: [ListTile(
                    leading: CircleAvatar(child: Text('#${index + 1}')),
                    title: Text(steps[index],
           style: TextStyle(
                 fontSize: 15,
                 fontWeight: FontWeight.bold,
                 fontFamily: 'RobotoCondensed')),),
                 Divider()]
              );
            },
          ),
        ),
      ],
    );
  }
}
