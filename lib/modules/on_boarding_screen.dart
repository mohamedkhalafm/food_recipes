import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_recipes/components/components.dart';
import 'package:food_recipes/models/meal_model.dart';
import 'package:food_recipes/modules/categories_screen.dart';
import 'package:food_recipes/modules/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  static const bodyStyle = TextStyle(fontSize: 19.0);
  List<MealModel> favorites = [];
  List<PageViewModel> getOnBoarding = [
    PageViewModel(
        title: 'First, we eat. Then, we do everything else',
        body:
            'Despite what psychologists say, it’s totally okay to replace love with food',
        image: const Image(
            image: NetworkImage(
                'https://img.freepik.com/free-photo/tortilla-wrap-with-falafel-fresh-salad-vegan-tacos-vegetarian-healthy-food-top-view_2829-6197.jpg?size=338&ext=jpg'))),
    PageViewModel(
        title: 'Good food, good mood.',
        body:
            'Whenever you see me seemingly thinking deep thoughts, I’m probably just thinking about food.',
        image: const Image(
            image: NetworkImage(
                'https://image.freepik.com/free-photo/vegetarian-falafel-with-vegetables-tzatziki-sauce-tortilla-bread-dark-wooden-background-top-view-copy-space_89816-28026.jpg'))),
    PageViewModel(
        title: 'If the fries is right, then we have a deal!',
        body:
            'We are lucky that we don’t have to venture into the wild and hunt for food anymore',
        image: const Image(
            image: NetworkImage(
                'https://image.freepik.com/free-photo/pizza-time-tasty-homemade-traditional-pizza-italian-recipe_144627-42528.jpg'))),
  ];

  final introKey = GlobalKey<IntroductionScreenState>();
  static const pageDecoration = PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: bodyStyle,
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.pinkAccent,
    imagePadding: EdgeInsets.zero,
  );

  void onDone(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomeScreen(favorites)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [firstColor, secondColor, thirdColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: IntroductionScreen(
        color: secondColor,
        globalBackgroundColor: secondColor,
        doneColor: Colors.white,
        skipColor: Colors.white,
        nextColor: Colors.white,
        done: const Text('Done'),
        next: const Text('Next'),
        skip: const Text('Skip'),
        onDone: () => onDone(context),
        onSkip: () => onDone(context),
        showDoneButton: true,
        showNextButton: true,
        showSkipButton: true,
        pages: getOnBoarding,
        curve: Curves.decelerate,
      ),
    );
  }
}
