import 'package:flutter/material.dart';

import '../../category_feature/data/model/model.dart';
import '../../core/constants/constant.dart';
import '../widgets/meal_ingredient_widget.dart';

class IngredientsScreen extends StatefulWidget {
  final Meal meal;
  final Color color;

  const IngredientsScreen({Key? key, required this.meal, required this.color})
      : super(key: key);

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  late Meal meal;
  late Color color;
  late List<Ingredients> ingredients;

  @override
  void initState() {
    meal = widget.meal;
    color = widget.color;
    ingredients = meal.recipe!.ingredients!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor(color),
          title: Text(
            'Ingredients',
          ),
        ),
        body: Container(
          height: Responsive.height,
          width: Responsive.width,
          child: Center(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Responsive.font),
                border: Border.all(color: decorationColor(color))),
            width: Responsive.width * 0.85,
            height: Responsive.height * 0.85,
            child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.padding * 1.5,
                  vertical: Responsive.padding * 1.5,
                ),
                itemBuilder: (_, index) => MealIngredientWidget(
                      image: meal.recipe!.ingredients![index].image.toString(),
                      label: meal.recipe!.ingredients![index].text.toString(),
                      color: color,
                    ),
                separatorBuilder: (_, index) => Divider(
                      color: decorationColor(color),
                    ),
                itemCount: ingredients.length),
          )),
        ));
  }
}
