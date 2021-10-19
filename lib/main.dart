import 'package:flutter/material.dart';
import '../screen/category_meal_screen.dart';

import '../screen/category_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
          // canvasColor: const Color.fromRGBO(25, 51, 51, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: const TextStyle(
                  fontSize: 28,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold)),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber)),
      home: const CatagoryScreen(),
      routes: {
        CategoryMealScreen.NameRoute: (ctx) => const CategoryMealScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal App'),
      ),
      body: const CatagoryScreen(),
    );
  }
}
