// ignore_for_file: empty_constructor_bodies, unused_local_variable, unrelated_type_equality_checks, missing_return

import 'package:flutter/material.dart';
import '../components/meal_item.dart';
import '../models/category.dart';
import '../data/dummy_data.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(category.title),
        ),
        body: ListView.builder(
            
            itemCount: categoryMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(meal: categoryMeals[index]);
            }));
  }
}
