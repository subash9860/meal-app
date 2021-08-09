import 'package:flutter/material.dart';
import 'package:meal_app/category_items.dart';

import './dummy_data.dart';

class CatagoryScreen extends StatelessWidget {
  const CatagoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Category Screen'),),
          body: GridView(
            padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((catData) => CategoryItem(catData.id!,catData.title, catData.color)
        ).toList(),
      ),
    );
  }
}
