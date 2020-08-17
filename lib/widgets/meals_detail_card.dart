import 'package:flutter/material.dart';

class MealsDetailCard extends StatelessWidget {
  final String imageUrl;
  final List ingredients;
  final List steps;
  MealsDetailCard(this.imageUrl, this.ingredients, this.steps);
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
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text(
            'Ingredients',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
        Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: ingredients
                      .map((e) => Container(
                            decoration: BoxDecoration(color: Colors.amber),
                            child: Text('${ingredients.indexOf(e) + 1}.\t'+e,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500)),
                          ))
                      .toList()),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text('Steps',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        ),
        Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: steps
                    .map((e) => Text('${steps.indexOf(e) + 1}.\t'+e,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
