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
  int selectedIndex = 0;

  final List<String> tabTitles = [
    'All',
    'Popular',
    'Recent',
    'Recommended',
  ];


  // void _onTabSelected(int index) {
  //   setState(() {
  //     _currentTab = index;
  //   });
  // }
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: tabTitles.asMap().entries.map((entry) {
                      final int index = entry.key;
                      final String title = entry.value;

                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: BuildTabItem(
                          title: title,
                          index: index,
                          onTabSelected: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          isActive: selectedIndex == index,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Text(
                //   'Selected tab: ${tabTitles[selectedIndex]}',
                //   style: TextStyle(fontSize: 20.0),
                // ),
              ],
            )
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

