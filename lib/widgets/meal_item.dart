import 'package:flutter/material.dart';
import 'package:food_recipes/components/components.dart';
import 'package:food_recipes/models/meal_model.dart';
import 'package:food_recipes/modules/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String id;
  final String mealImage;
  final Complexty complexity;
  final Effort effort;
  final int duration;

  MealItem({
    required this.title,
    required this.id,
    required this.mealImage,
    required this.complexity,
    required this.effort,
    required this.duration,
  });

  String get complexityText {
    switch (complexity) {
      case Complexty.Simple:
        return 'Simple';
        break;
      case Complexty.Difficult:
        return 'Difficult';
        break;
      case Complexty.Hard:
        return 'Hard';
        break;
      default:
        return 'UnKnown';
    }
  }

  String get effortText {
    switch (effort) {
      case Effort.Little:
        return 'Little';
        break;
      case Effort.Min:
        return 'Min';
        break;
      case Effort.Max:
        return 'Max';
        break;
      default:
        return 'UnKnown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed('/meal_details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [firstColor, secondColor, thirdColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: InkWell(
              onTap: () => selectMeal(context),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(18),
                  topLeft: Radius.circular(18),
                ),
                child: Stack(
                  children: [
                    Image(
                      image: NetworkImage(mealImage),
                      width: double.infinity,
                      height: 240,
                    ),
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10),
                          color: Colors.black54,
                          width: 130,
                          height: 50,
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.subtitle1,
                            overflow: TextOverflow.fade,
                            softWrap: true,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [firstColor, firstColor, firstColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text('$duration minutes')
                    ],
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(complexityText)
                    ],
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.monetization_on),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(effortText)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
