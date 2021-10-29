import 'package:flutter/material.dart';
import 'package:food_recipes/components/components.dart';
import 'package:food_recipes/models/category_model.dart';
import 'package:food_recipes/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [firstColor, secondColor, thirdColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Main Recipes',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.black),
                ),
                Row(
                  children: mainRecipes
                      .map((element) =>
                          CategoryItem(element.id, element.name, element.image))
                      .toList(),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Recipes for you',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.black),
                ),
                Row(
                  children: recipesForYou
                      .map((element) =>
                          CategoryItem(element.id, element.name, element.image))
                      .toList(),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Drinks',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.black),
                ),
                Row(
                  children: hotRecipes
                      .map((element) =>
                          CategoryItem(element.id, element.name, element.image))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
