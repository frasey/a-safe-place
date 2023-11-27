import 'package:a_safe_place/AppMenu.dart';
import 'package:flutter/material.dart';
import 'AppMenu.dart';
import 'package:a_safe_place/Homepage/MenuTile.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  PreferredSizeWidget buildAppBar(buildContext context) {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'A Safe Place',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Builder(builder: (BuildContext context) {
            // leading is for a widget to display before the appBar's title
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // CALL DRAWER OPEN FUNCTION HERE
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                //OPEN PROFILE PAGE HERE
              },
            )
          ],
        ),

        drawer: const AppMenu(),
      );
    }
  }
}