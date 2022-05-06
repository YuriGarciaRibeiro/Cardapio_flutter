// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'favorite_screen.dart';
import 'categories_screen.dart';



class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
        bottom: TabBar(
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            const Tab(
              icon: Icon(Icons.category),
              text: 'Categories',
            ),
            const Tab(
              icon: Icon(Icons.star),
              text: 'Favorites',
            )
          ],
        ),
      ),
      body: TabBarView(
        children: [
          CategoriesScreen(),
          FavoriteScreen(),
        ],
      ),
    ));
  }
}
