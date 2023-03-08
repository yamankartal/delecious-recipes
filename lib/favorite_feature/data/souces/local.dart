import 'package:delisious_recipes/core/failures/failures.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../category_feature/data/model/model.dart';

class LocalFavorite {
  final Box favoriteBox;

  LocalFavorite(this.favoriteBox);

  List<Meal> getFavoriteMeals() {
    try {
      List meals = favoriteBox.get('favoriteMeals') ?? [];
      return <Meal>[...meals];
    } catch (e) {
      throw CacheFailure();
    }
  }

  void removeFromFavorite(Meal meal) {
    try {
      List<Meal> meals = getFavoriteMeals();
      meals.removeWhere(
          (element) => element.recipe!.label == meal.recipe!.label);
      favoriteBox.put('favoriteMeals', meals);
    } catch (e) {
      throw CacheFailure();
    }
  }

  void addToFavorite(Meal meal) {
    try {
      List<Meal> meals = getFavoriteMeals();
      meals.add(meal);
      favoriteBox.put('favoriteMeals', meals);
    } catch (e) {
      throw CacheFailure();
    }
  }
}
