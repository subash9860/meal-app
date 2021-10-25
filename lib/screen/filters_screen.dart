// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:meal_app/widgets/min_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-Screen';
  final Function _setfilters;
  final Map<String, bool> currentfilters;
  FiltersScreen(this.currentfilters, this._setfilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGutenFree = false;
  var _isLactoesFree = false;
  var _isVagan = false;
  var _isVegetable = false;

  @override
  initState() {
    _isGutenFree = widget.currentfilters['gluten'] as bool;
    _isLactoesFree = widget.currentfilters['lactoes'] as bool;
    _isVagan = widget.currentfilters['Vegan'] as bool;
    _isVegetable = widget.currentfilters['vegeritan'] as bool;
    super.initState();
  }

  Widget _buildSwitchTile(
      String title, String subtitle, bool valueToChange, Function _onchanged) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: (_) => _onchanged(_),
      value: valueToChange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _isGutenFree,
                  'lactoes': _isLactoesFree,
                  'Vegan': _isVagan,
                  'vegeritan': _isVegetable,
                };
                widget._setfilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selections.",
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile(
                  "Guteen Free",
                  "Only guteen free meal",
                  _isGutenFree,
                  (bool value) => setState(() {
                    _isGutenFree = value;
                  }),
                ),
                _buildSwitchTile(
                  "Lactoes Free",
                  "Only Lactoes free meal",
                  _isLactoesFree,
                  (bool value) => setState(() {
                    _isLactoesFree = value;
                  }),
                ),
                _buildSwitchTile(
                  "Vegan ",
                  "Only Vegan meal",
                  _isVagan,
                  (bool value) => setState(() {
                    _isVagan = value;
                  }),
                ),
                _buildSwitchTile(
                  "Vegeterian ",
                  "Only vegeterian meal",
                  _isVegetable,
                  (bool value) => setState(() {
                    _isVegetable = value;
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
