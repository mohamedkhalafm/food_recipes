import 'package:flutter/material.dart';
import 'package:food_recipes/modules/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String name;
  final String image;

  // ignore: use_key_in_widget_constructors
  const CategoryItem(this.id, this.name, this.image);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/category_meal',
                  arguments: {'name': name, 'id': id});
            },
            splashColor: Colors.blue,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Stack(
                children: [
                  Image(
                    height: 200,
                    width: 200,
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 15,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10),
                      width: 90,
                      height: 28,
                      color: Colors.black54,
                      child: Text(
                        name,
                        style: Theme.of(context).textTheme.subtitle1,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
