import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/widgets/meal_items.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritesMeal;

  FavoritesScreen(this.favoritesMeal);
  // const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   if (favoritesMeal.isEmpty) {
      return Center(
        child: Text('You have no filters yet! start adding some.'),
      );
    }
    else{
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoritesMeal[index].id,
              title: favoritesMeal[index].title,
              imageurl: favoritesMeal[index].imageUrl,
              affordability: favoritesMeal[index].affordability,
              complexity: favoritesMeal[index].complexity,
              duration: favoritesMeal[index].duration,
              // delectMeal: deleteMeal,
            );
          },
          itemCount: favoritesMeal.length,
        );

    }

  }
}