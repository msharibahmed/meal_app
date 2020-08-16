import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class RecipieCard extends StatelessWidget {
  final String id;
  final String title;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;

  final int duration;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  RecipieCard({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.imageUrl,
    @required this.complexity,
    @required this.affordability,
  });
  String get complexityGet {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityGet {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.amber,
      borderRadius: BorderRadius.circular(5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 5,
        shadowColor: Colors.pink,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                        color: Colors.black54,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: 250,
                        child: Text(
                          title,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 26, color: Colors.white),
                        )))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time),
                      SizedBox(
                        width: 6,
                      ),
                      Text(duration.toString())
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.card_travel),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityGet)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityGet)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}