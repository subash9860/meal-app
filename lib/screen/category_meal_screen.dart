import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_items.dart';

import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String categoryID;
  // final String categoryTitle;

  // CategoryMealScreen(this.categoryID, this.categoryTitle);
  // ignore: constant_identifier_names
  static const NameRoute = '/category-meal';

  const CategoryMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    // ignore: non_constant_identifier_names
    final CatergoriesMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                title: CatergoriesMeal[index].title,
                imageurl: CatergoriesMeal[index].imageUrl,
                affordability: CatergoriesMeal[index].affordability,
                complexity: CatergoriesMeal[index].complexity,
                duration: CatergoriesMeal[index].duration);
            // Text(CatergoriesMeal[index].title);
          },
          itemCount: CatergoriesMeal.length,
        ));
  }
}
