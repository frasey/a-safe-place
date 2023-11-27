import 'package:a_safe_place/AppMenu.dart';
import 'package:flutter/material.dart';
import 'AppMenu.dart';
import 'package:a_safe_place/Homepage/MenuTile.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key});

    @override
    Widget build(BuildContext context) {
      return const Scaffold(
        drawer: AppMenu(),
      );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar:AppBar(
            centerTitle: true,
            title: const Text(
              'A Safe Place',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                // OPEN PROFILE PAGE HERE
              },
            ),
          ],
          ),
        );
      }
    }