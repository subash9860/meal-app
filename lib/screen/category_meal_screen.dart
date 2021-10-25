import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_items.dart';
// import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  // final String categoryID;
  // final String categoryTitle;

  // CategoryMealScreen(this.categoryID, this.categoryTitle);
  // ignore: constant_identifier_names
  static const NameRoute = '/category-meal';

  final List<Meal> avialableMeal;

  const CategoryMealScreen({Key? key, required this.avialableMeal}) : super(key: key);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoryTitle;
  List<Meal>? CatergoriesMeal;
  var changestate = false;

  @override
  void didChangeDependencies() {
    if (!changestate) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      CatergoriesMeal = widget.avialableMeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    }
    changestate = true;
    super.didChangeDependencies();
  }

  void deleteMeal(String mealId) {
    setState(() {
      CatergoriesMeal!.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: CatergoriesMeal![index].id,
              title: CatergoriesMeal![index].title,
              imageurl: CatergoriesMeal![index].imageUrl,
              affordability: CatergoriesMeal![index].affordability,
              complexity: CatergoriesMeal![index].complexity,
              duration: CatergoriesMeal![index].duration,
              // delectMeal: deleteMeal,
            );
          },
          itemCount: CatergoriesMeal!.length,
        ));
  }
}
