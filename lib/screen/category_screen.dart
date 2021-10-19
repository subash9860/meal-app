import 'package:flutter/material.dart';
import '../widgets/category_items.dart';

import '../dummy_data.dart';

class CatagoryScreen extends StatelessWidget {
  const CatagoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Category Screen'),
      ),
      body: GridView(
        padding:const EdgeInsets.all(25),
        gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
                  catData.id!,
                  catData.title!,
                  catData.color,
                ))
            .toList(),
      ),
    );
  }
}
