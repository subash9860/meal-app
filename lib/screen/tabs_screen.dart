import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import '../widgets/min_drawer.dart';
import './category_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  // const TabsScreen({Key? key}) : super(key: key);
  final List<Meal> favoritesMeal;

  const TabsScreen(this.favoritesMeal, {Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // for simplely showing
  // final List<Widget> _page = [CatagoryScreen(), FavoritesScreen()];
  //for better approch / dynamically
  List<Map<String, Widget>> _page = [];
  @override
  initState() {
    _page = [
      {'page': const CatagoryScreen(), 'title': const Text("Meal")},
      {
        'page': FavoritesScreen(widget.favoritesMeal),
        'title': const Text("Your Favorite")
      }
    ];
    super.initState();
  }

  int _pageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return

        //this is for tabs in top appbar
        // DefaultTabController(
        // length: 2,
        // child:

        // This is button bar navigation

        Scaffold(
      appBar: AppBar(
        title: _page[_pageIndex]['title'],

        // this id from top app bar Tabs nivagiton
        // bottom: TabBar(
        //   tabs: [
        //     Tab(
        //       icon: Icon(
        //         Icons.category,
        //       ),
        //       text: "Categorues",
        //     ),
        //     Tab(
        //       icon: Icon(Icons.star),
        //       text: "Favorites",) ],),
      ),
      endDrawer: const MainDrawer(),

      body: _page[_pageIndex]['page'],
      // TabBarView(
      // children: [CatagoryScreen(), FavoritesScreen()],),),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.redAccent,
        selectedItemColor: Colors.yellowAccent,
        unselectedItemColor: Colors.white,
        currentIndex: _pageIndex,
        // type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
              // backgroundColor: Colors.redAccent,
              icon: Icon(Icons.category),
              label: "Category"),
          BottomNavigationBarItem(
              // backgroundColor: Colors.redAccent,
              icon: Icon(Icons.star),
              label: "Favorites"),
        ],
      ),
    );
  }
}
