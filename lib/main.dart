// ignore_for_file: missing_return
import 'models/settings.dart';
import 'screens/settings_screen.dart';
import 'screens/tabas_screen.dart';
import 'package:flutter/material.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'utils/app_routs.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  Settings _settings = Settings();
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(
      () {
        _settings = settings;
        _availableMeals = DUMMY_MEALS.where((meal) {
          final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
          final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
          final filterVegan = settings.isVegan && !meal.isVegan;
          final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

          return !filterGluten &&
              !filterLactose &&
              !filterVegan &&
              !filterVegetarian;
        }).toList();
      },
    );
  }

  void _toggleFavorite(Meal meal) {
    setState(
      () {
        _favoriteMeals.contains(meal)
            ? _favoriteMeals.remove(meal)
            : _favoriteMeals.add(meal);
      },
    );
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        fontFamily: "Raleway",
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
              ),
              titleMedium: const TextStyle(
                fontSize: 18,
                fontFamily: "RobotoCondensed",
              ),
              titleSmall: const TextStyle(
                fontSize: 16,
                fontFamily: "RobotoCondensed",
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite,_isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(
            onSettingsChanged: _filterMeals, settings: _settings),
      },
    );
  }
}
