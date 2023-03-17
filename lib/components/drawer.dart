import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Settings'),
            decoration: BoxDecoration(
              color: Colors.yellow,
            ),
          ),
          ListTile(
            title: Text('Account'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Notifications'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
