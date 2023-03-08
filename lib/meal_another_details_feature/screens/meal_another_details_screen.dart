import 'package:delisious_recipes/core/constants/constant.dart';
import 'package:delisious_recipes/meal_another_details_feature/widgets/meal_another_details_widget.dart';
import 'package:flutter/material.dart';

import '../../category_feature/data/model/model.dart';

class MealAnotherDetailsScreen extends StatefulWidget {
  final Color color;
  final Meal meal;

  const MealAnotherDetailsScreen({Key? key, required this.color, required this.meal}) : super(key: key);

  @override
  State<MealAnotherDetailsScreen> createState() => _MealAnotherDetailsScreenState();
}

class _MealAnotherDetailsScreenState extends State<MealAnotherDetailsScreen> {
late Color color;
late Meal meal;

  @override
  void initState() {
    color=widget.color;
    meal=widget.meal;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor(color),
        title: Text('Another details'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.font,
          vertical: Responsive.font*2,
        ),
        width: Responsive.width,
        height: Responsive.height,
        child: SingleChildScrollView(

          child: Column(
            children: [
              MealAnotherDetailsWidget(label:'DietLabels',color:color ,list:[...meal.recipe!.dietLabels!.toList()],),
              SizedBox(height: Responsive.font*1.5),
              MealAnotherDetailsWidget(label:  'HealthLabels',color:color ,list: [...meal.recipe!.healthLabels!.toList()],),
              SizedBox(height: Responsive.font*1.5),
              MealAnotherDetailsWidget(label:    'MealType',color:color ,list: [...?meal.recipe!.mealType],),
              SizedBox(height: Responsive.font*1.5),
              MealAnotherDetailsWidget(label:  'DishType', color:color ,list: [...?meal.recipe!.dishType],),
              SizedBox(height: Responsive.font*1.5),
              MealAnotherDetailsWidget(label:  'cautions', color:color ,list: [...?meal.recipe!.cautions],),
              SizedBox(height: Responsive.font*1.5),
              MealAnotherDetailsWidget(label:   'Calories',color:color ,list: [meal.recipe!.calories!.roundToDouble()],),
              SizedBox(height: Responsive.font*1.5),
              MealAnotherDetailsWidget(label:  'TotalWeight', color:color ,list: [meal.recipe!.totalWeight!.roundToDouble()],),
            ],
          ),
        ),
      ),
    );
  }
}
