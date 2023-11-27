import 'package:flutter/material.dart';
import 'Homepage/MenuTile.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Text('Menu'),
            ),
            MenuTile(title: 'Home'),
            MenuTile(title: 'Profile'),
            MenuTile(title: 'Your tags'),
            MenuTile(title: 'Your docs/images'),
            MenuTile(title: 'All events'),
            MenuTile(title: 'Create new event'),
            MenuTile(title: 'Log out')
          ],
        ),
      ),
    );
  }
}