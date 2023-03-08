import 'package:cached_network_image/cached_network_image.dart';
import 'package:delisious_recipes/is_favorite_feature/presentation/widgets/floatin_favorite_button_widget.dart';
import 'package:delisious_recipes/meal_another_details_feature/screens/meal_another_details_screen.dart';
import 'package:delisious_recipes/meal_ingredients_feature/screens/ingredients_screen.dart';
import 'package:delisious_recipes/meal_nutrients_value_feature/screens/meal_nutrients_value_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../category_feature/data/model/model.dart';
import '../../../core/constants/constant.dart';
import '../../../favorite_feature/presentation/bloc/favorite_bloc.dart';
import '../../../is_favorite_feature/presentation/bloc/is_favorite_bloc.dart';
import '../widgets/meal_details_widget.dart';

class MealDetailsScreen extends StatefulWidget {
  final Color color;
  final Meal meal;

  const MealDetailsScreen({Key? key, required this.color, required this.meal})
      : super(key: key);

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  late Color color;
  late Meal meal;
  late IsFavoriteBloc isFavoriteBloc;
  late FavoriteBloc favoriteBloc;

  @override
  void initState() {
    favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
    isFavoriteBloc = BlocProvider.of<IsFavoriteBloc>(context);
    color = widget.color;
    meal = widget.meal;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor(color),
        title: Text(meal.recipe!.label.toString()),
      ),
      body: Container(
        width: Responsive.width,
        height: Responsive.height,
        child: Column(
          children: [
            Container(
              height: Responsive.height * 0.5,
              width: Responsive.width,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: meal.recipe!.image.toString(),
                placeholder: (_, s) => Image.asset(
                  'assets/images/holder/holder.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => IngredientsScreen(
                      meal: meal,
                      color: color,
                    ),
                  ),
                );
              },
              child: MealDetailsWidget(
                color: color,
                label: 'Ingredients',
              ),
            ),

            InkWell(
              child: MealDetailsWidget(
                color: color,
                label: 'Nutrients value',
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => MealNutrientsValueScreen(
                      color: color,
                      meal: meal,
                    ),
                  ),
                );
              },
            ),

            InkWell(
              child: MealDetailsWidget(
                color: color,
                label: 'Another details',
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => MealAnotherDetailsScreen(
                      color: color,
                      meal: meal,
                    ),
                  ),
                );
              },
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingFavoriteButtonWidget(
        isFavoriteBloc: isFavoriteBloc,
        favoriteMealsBloc: favoriteBloc,
        meal: meal, color: color,
      ),
    );
  }
}
