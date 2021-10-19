import 'package:flutter/material.dart';

import '../models/meals.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageurl;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;

  const MealItem({
    Key? key,
    required this.title,
    required this.imageurl,
    required this.affordability,
    required this.complexity,
    required this.duration,
  }) : super(key: key);

  void selectMeal() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.asset(
                    imageurl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
