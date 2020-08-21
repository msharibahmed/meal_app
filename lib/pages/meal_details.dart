import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meals_detail_card.dart';

class MealDetails extends StatelessWidget {
  static const namedRoute = '/meal-details';

  @override
  Widget build(BuildContext context) {
    /*like we are getting all the documents via moalroute argument
    we could also get only one argument which is id and by using below 
    statement we can get all the details of that id information(.firstwhere is 
    a collary of '.where' where we verify the conditions and if its true then its added in the variable
     if not it removed but thats for when we have list but '.firstWhere' is for when have only one element) */

    // final routeId = ModalRoute.of(context).settings.arguments as   String;
    //here we have passed the id argument via pushnamed ffrom previous screen
    //  final selectMeal= DUMMY_DATA.firstWhere((element) => return element.Id==routeId;)
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    final String title = routeArgs['title'];
    final String imageUrl = routeArgs['imageUrl'];
    final List ingredients = routeArgs['ingredients'];
    final List steps = routeArgs['steps'];
    final String id = routeArgs['id'];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.of(context).pop(id);
        },
        child: Icon(Icons.star_border),
      ),
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
          child: MealsDetailCard(imageUrl, ingredients, steps)),
    );
  }
}
