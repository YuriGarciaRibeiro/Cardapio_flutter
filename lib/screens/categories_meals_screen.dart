// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category; 


    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text('Meals'),
      ),
    );
  }
}
