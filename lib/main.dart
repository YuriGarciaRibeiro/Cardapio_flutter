import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      home: CategoriesScreen(),
    );
  }
}
