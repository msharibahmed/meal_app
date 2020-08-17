import 'package:flutter/material.dart';

import 'package:meal_app/dummy_data.dart';
import '../widgets/recipie_card.dart';

class CategoryMeals extends StatelessWidget {
  static const String namedRoute = '/category-meals';
  // final String id;
  // final String title;
  // CategoryMeals(this.id,this.title);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();
    return Scaffold(
      body: CustomScrollView(
        slivers: [SliverAppBar(expandedHeight: 150, 
          floating: true,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
              fit:BoxFit.cover,),
            title: Container(width:double.infinity,color:Colors.black54,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title,style:TextStyle(fontFamily: 'RobotoCondensed')),
            )),
          ),),
          SliverList(delegate: SliverChildBuilderDelegate((context,index){
           return  RecipieCard(
                 id: categoryMeals[index].id,
                 title: categoryMeals[index].title,
                 imageUrl: categoryMeals[index].imageUrl,
                 duration: categoryMeals[index].duration,
                 affordability: categoryMeals[index].affordability,
                 complexity: categoryMeals[index].complexity,
                 categories: categoryMeals[index].categories,
                 ingredients: categoryMeals[index].ingredients,
                 steps: categoryMeals[index].steps);

          },childCount:categoryMeals.length,))
         ],
   
      ),
    );
  }
}



        // appBar: AppBar(
        //   title: Text(title),
        // ),
        // body: ListView.builder(
        //   itemBuilder: (context, index) {
        //     return RecipieCard(
        //         id: categoryMeals[index].id,
        //         title: categoryMeals[index].title,
        //         imageUrl: categoryMeals[index].imageUrl,
        //         duration: categoryMeals[index].duration,
        //         affordability: categoryMeals[index].affordability,
        //         complexity: categoryMeals[index].complexity,
        //         categories: categoryMeals[index].categories,
        //         ingredients: categoryMeals[index].ingredients,
        //         steps: categoryMeals[index].steps);
        //   },
        //   itemCount: categoryMeals.length,
        // )
        //  SliverFillRemaining(
        //     child: ListView.builder(
        //    itemBuilder: (context, index) {
        //      return RecipieCard(
        //          id: categoryMeals[index].id,
        //          title: categoryMeals[index].title,
        //          imageUrl: categoryMeals[index].imageUrl,
        //          duration: categoryMeals[index].duration,
        //          affordability: categoryMeals[index].affordability,
        //          complexity: categoryMeals[index].complexity,
        //          categories: categoryMeals[index].categories,
        //          ingredients: categoryMeals[index].ingredients,
        //          steps: categoryMeals[index].steps);
        //    },
        //    itemCount: categoryMeals.length,
        //  )
        //   )