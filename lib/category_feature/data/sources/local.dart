import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/failures/failures.dart';
import '../model/model.dart';

class LocalCategory {
  final Box categoryBox;

  LocalCategory(this.categoryBox);

  void cacheCategoryMeals(String name, List<Meal> meals) {
    try {
      categoryBox.put(name, meals);
    } catch (e) {
      throw CacheFailure();
    }
  }

  List<Meal> getCachedCategoryMeals(String name) {
    try {
      List list = categoryBox.get(name) ?? [];
      return <Meal>[...list];
    } catch (e) {
      throw CacheFailure();
    }
  }
}
