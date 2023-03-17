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
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        IconButton(
          icon: Icon(Icons.category),
          onPressed: () {
            Navigator.pushNamed(context, '/categories');
          },
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {Navigator.pushNamed(context, '/search');},
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
