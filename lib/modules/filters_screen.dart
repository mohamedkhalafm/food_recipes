import 'package:flutter/material.dart';
import 'package:food_recipes/components/components.dart';
import 'package:food_recipes/models/category_model.dart';
import 'package:food_recipes/widgets/category_item.dart';
import 'package:food_recipes/widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isSugarFree = false;
  bool vegetrian = false;
  bool vegan = false;
  bool isLactoseFree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        backgroundColor: firstColor,
        elevation: 0.0,
      ),
      drawer: const MyDrawer(),
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [firstColor, secondColor, thirdColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Text(
                    'Choose kind of food you want',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      SwitchListTile(
                        value: isSugarFree,
                        onChanged: (newValue) {
                          setState(() {
                            isSugarFree = newValue;
                          });
                        },
                        title: Text(
                          'Sugar free',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        subtitle: Text(
                          'Meals that is sugar free',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SwitchListTile(
                        value: vegetrian,
                        onChanged: (newValue) {
                          setState(() {
                            vegetrian = newValue;
                          });
                        },
                        title: Text(
                          'Vegetrian ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        subtitle: Text(
                          'Meals that is only Vegetrian',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SwitchListTile(
                        value: vegan,
                        onChanged: (newValue) {
                          setState(() {
                            vegan = newValue;
                          });
                        },
                        title: Text(
                          'vegan',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        subtitle: Text(
                          'Meals that is only Vegan',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SwitchListTile(
                        value: isLactoseFree,
                        onChanged: (newValue) {
                          setState(() {
                            isLactoseFree = newValue;
                          });
                        },
                        title: Text(
                          'Lactose Free',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        subtitle: Text(
                          'Meals that is Lactose Free',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
