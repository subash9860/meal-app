import 'package:flutter/material.dart';

import '../screen/meals_details_screen.dart';
import '../models/meals.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageurl;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  // final Function delectMeal;

   const MealItem({Key? key, 
    required this.id,
    required this.title,
    required this.imageurl,
    required this.affordability,
    required this.complexity,
    required this.duration,
    // this.delectMeal,
  }) : super(key: key);

  get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
      case Complexity.Challenging:
        return 'challenging';
      case Complexity.Hard:
        return 'hard';
      default:
        break;
    }
  }

  get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        break;
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealsDetails.routeName,
      arguments: id,
    );
    //     .then((value) {
    //   if (value != null) {
    //     delectMeal(value);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
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
                  child: Image.network(
                    imageurl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    color: Colors.black45,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        size: 30,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '$duration min  ',
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.work,
                        size: 30,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '$complexityText',
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                        size: 30,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '$affordabilityText',
                        style: const TextStyle(fontSize: 18),
                      )
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
