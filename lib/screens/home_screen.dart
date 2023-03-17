import 'package:flutter/material.dart';
import 'package:la_pic/components/items_list.dart';
import 'package:la_pic/components/bottom_menu.dart';
import 'package:la_pic/components/tab_items.dart';
import 'package:la_pic/components/drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentTab = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentTab = index;
    });
  }
  List<String> _items =
      List.generate(40, (index) => 'assets/images/item${index % 10}.jpg');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.yellow),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Center(
            child: Text(
              'LaEpic Botique',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              onPressed: () {},
            ),
          ],
        ),
        drawer: drawer(),

        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildTabItem(title: 'All',
                  index: 0,
                  onTabSelected: _onTabSelected,
                  isActive: _currentTab == 0,),
                BuildTabItem(title: 'Popular', index: 1,
                  onTabSelected: _onTabSelected,
                  isActive: _currentTab == 1,),
                BuildTabItem(title: 'Recent', index: 2,
                  onTabSelected: _onTabSelected,
                  isActive: _currentTab == 2,),
                BuildTabItem(title: 'Recommended', index: 3,
                  onTabSelected: _onTabSelected,
                  isActive: _currentTab == 3,),
              ],
            ),
          ),
          BuildItemList(
            items: _items,
          ),
          BuildBottomMenu()
        ]),
      ),
    );
  }
}

