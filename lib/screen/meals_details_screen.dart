import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealsDetails extends StatelessWidget {
  static const routeName = '/meals-detail';
  final Function isMealFavorites;

  final Function toggleFavorites;
  const MealsDetails(this.isMealFavorites, this.toggleFavorites, {Key? key})
      : super(key: key);
  // const MealsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 40),
                    child: Text(
                      'Ingredients',
                      style: Theme.of(context).textTheme.headline6,
                      textScaleFactor: 1.8,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(mealId);
                    },
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                height: 200,
                width: MediaQuery.of(context).size.width * 0.85,
                child: ListView.builder(
                    itemCount: selectedMeal.ingredients.length,
                    itemBuilder: (ctx, index) => Card(
                          color: Colors.amberAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(selectedMeal.ingredients[index]),
                          ),
                        )),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Steps',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                height: 200,
                width: MediaQuery.of(context).size.width * 0.85,
                child: ListView.builder(
                    itemCount: selectedMeal.steps.length,
                    itemBuilder: (ctx, index) => Card(
                          // color: Colors.amberAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "${(index + 1)}. ${selectedMeal.steps[index]}"),
                          ),
                        )),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => toggleFavorites(mealId),
          child: Icon(
            isMealFavorites(mealId) ? Icons.star : Icons.star_border,
          ),
        ));
  }
}
