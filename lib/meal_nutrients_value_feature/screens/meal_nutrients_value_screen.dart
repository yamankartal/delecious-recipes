import 'package:flutter/material.dart';

import '../../category_feature/data/model/model.dart';
import '../../core/constants/constant.dart';
import '../widgets/meal_nutrient_value_widget.dart';

class MealNutrientsValueScreen extends StatefulWidget {
  final Color color;
  final Meal meal;

  const MealNutrientsValueScreen(
      {Key? key, required this.color, required this.meal})
      : super(key: key);

  @override
  State<MealNutrientsValueScreen> createState() =>
      _MealNutrientsValueScreenState();
}

class _MealNutrientsValueScreenState extends State<MealNutrientsValueScreen> {
  late Meal meal;
  late Color color;
  late List<TotalNutrientsValue> nutrientsValue;

  @override
  void initState() {
    color = widget.color;
    meal = widget.meal;
    nutrientsValue = meal.recipe!.nutrientsValue!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor(color),
        title: Text("Nutrients value"),
      ),
      body: ListView.separated(
          padding: EdgeInsets.symmetric(
            vertical: Responsive.font,
            horizontal: Responsive.font,
          ),
          itemBuilder: (_, index) => MealNutrientValueWidget(
              color: color,
              label: meal.recipe!.nutrientsValue![index].label.toString(),
              quantity:
                  meal.recipe!.nutrientsValue![index].quantity!.roundToDouble(),
              unit: meal.recipe!.nutrientsValue![index].unit.toString()),
          separatorBuilder: (_, index) => SizedBox(
                height: Responsive.font,
              ),
          itemCount: nutrientsValue.length),
    );
  }
}
