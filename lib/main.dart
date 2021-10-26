import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meals.dart';
import './screen/filters_screen.dart';
import '../screen/tabs_screen.dart';
import '../screen/meals_details_screen.dart';
import '../screen/category_meal_screen.dart';
import '../screen/category_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactoes': false,
    'Vegan': false,
    'vegeritan': false
  };
  List<Meal> _avialableMeals = DUMMY_MEALS;
 final List<Meal> _favoritesMeals = [];
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _avialableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] as bool && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactoes'] as bool && !element.isLactoseFree) {
          return false;
        }
        if (_filters['Vegan'] as bool && !element.isVegan) {
          return false;
        }
        if (_filters['vegeritan'] as bool && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(mealId) {
    final excitinIndex =
        _favoritesMeals.indexWhere((element) => element.id == mealId);
    if (excitinIndex >= 0) {
      setState(() {
      _favoritesMeals.removeAt(excitinIndex);
      });
    } else {
      setState(() {
      _favoritesMeals
          .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorites(String id) {
    return _favoritesMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
          primaryColor: Colors.redAccent,
          // ignore: deprecated_member_use
          accentColor: Colors.yellow,
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

      // home: const TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoritesMeals),
        CategoryMealScreen.NameRoute: (ctx) =>
            CategoryMealScreen(avialableMeal: _avialableMeals),
        MealsDetails.routeName: (ctx) =>
            MealsDetails(_isMealFavorites, _toggleFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        // print(settings.arguments);
        // if(settings.name == "/meal-detail")
        // {
        //   return ...;
        // }
        // else if (settings.name == "/some-things else"){
        //   return ....;
        // }
        // return MaterialPageRoute(builder: (ctx)=> CatagoryScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) =>const CatagoryScreen());
      },
    );
  }
}
