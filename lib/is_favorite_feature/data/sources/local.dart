import 'package:delisious_recipes/core/failures/failures.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../category_feature/data/model/model.dart';

class LocalIsFavorite {
  final Box favoriteBox;

  LocalIsFavorite(this.favoriteBox);

  bool isFavorite(Meal meal) {
    try {
      List list = favoriteBox.get('favoriteMeals') ?? <Meal>[];
      List<Meal> meals = <Meal>[...list];
      if (meals.isEmpty) return false;
      for (Meal m in meals) {
        if (m.recipe?.label == meal.recipe?.label) return true;
      }
      return false;
    } catch (e) {
      throw CacheFailure();
    }
  }
}
