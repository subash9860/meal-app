import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  final String categoryID;
  final String categoryTitle;

  CategoryMealScreen(this.categoryID, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('This is category screen!'),
      ),
    );
  }
}
