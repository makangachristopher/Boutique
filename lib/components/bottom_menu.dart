import 'package:flutter/material.dart';

class BuildBottomMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.category),
          onPressed: () {
            Navigator.pushNamed(context, '/categories');
          },
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
        ),
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ],
    ),
  );
}}



// bottomNavigationBar: BottomNavigationBar(
// currentIndex: _currentTab,
// onTap: (int index) {
// setState(() {
// _currentTab = index;
// });
// },
// items: [
// BottomNavigationBarItem(
// icon: Icon(Icons.home),
// label: 'Home',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.category),
// label: 'Search',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.shopping_cart),
// label: 'Favorites',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.person),
// label: 'Settings',
// ),
// ],
// selectedItemColor: Colors.yellowAccent,
//
// ),