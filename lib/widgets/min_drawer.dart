import 'package:flutter/material.dart';

import 'package:meal_app/screen/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function ontapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black),
      ),
      onTap: () => ontapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.18,
            width: double.infinity,
            padding: EdgeInsets.all(40),
            alignment: Alignment.bottomLeft,
            color: Colors.amberAccent,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
