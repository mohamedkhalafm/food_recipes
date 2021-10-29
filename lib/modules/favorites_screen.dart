import 'package:flutter/material.dart';
import 'package:food_recipes/components/components.dart';
import 'package:food_recipes/models/meal_model.dart';
import 'package:food_recipes/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  List<MealModel> favorites;
  FavoritesScreen(this.favorites);
  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [firstColor, secondColor, thirdColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Center(
              child: Text(
            'You dont have any favorites meals , Start add new ',
            style: Theme.of(context).textTheme.subtitle1,
          )));
    } else {
      return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [firstColor, secondColor, thirdColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                id: favorites[index].id,
                title: favorites[index].title,
                mealImage: favorites[index].mealImage,
                complexity: favorites[index].complexity,
                effort: favorites[index].effort,
                duration: favorites[index].duration);
          },
          itemCount: favorites.length,
        ),
      );
    }
  }
}
