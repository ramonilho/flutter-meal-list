import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  // Could be a different widget file. But as long as I only use on this file, its fine.
  Widget buildListTitle(String title, IconData icon, Function tapHandler) {
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
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up!',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
            ),
            color: Theme.of(context).accentColor,
          ),
          SizedBox(height: 26),
          buildListTitle('Meals', Icons.restaurant, () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          buildListTitle('Filters', Icons.settings, () {
            Navigator.pushReplacementNamed(context, FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
