import 'package:flutter/material.dart';
import 'package:food_recipes/components/components.dart';
import 'package:food_recipes/models/category_model.dart';
import 'package:food_recipes/models/meal_model.dart';
import 'package:food_recipes/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String categoryName;
  // final String categoryId;

  // CategoryMealScreen(this.categoryName, this.categoryId);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryName = arguments['name'];
    final CategoryId = arguments['id'];
    final CategoryMeal = MEALRecipes.where((meal) {
      return meal.categories.contains(CategoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryName!),
          backgroundColor: firstColor,
          elevation: 0.0,
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [firstColor, secondColor, thirdColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                  id: CategoryMeal[index].id,
                  title: CategoryMeal[index].title,
                  mealImage: CategoryMeal[index].mealImage,
                  complexity: CategoryMeal[index].complexity,
                  effort: CategoryMeal[index].effort,
                  duration: CategoryMeal[index].duration);
            },
            itemCount: CategoryMeal.length,
          ),
        ));
  }
}
