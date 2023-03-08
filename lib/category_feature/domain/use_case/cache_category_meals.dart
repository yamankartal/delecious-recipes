import 'package:dartz/dartz.dart';
import 'package:delisious_recipes/core/failures/failures.dart';

import '../../data/model/model.dart';
import '../repository/repository.dart';
import 'category_use_case.dart';

class CaseCachetCategoryMeals
    extends CategoryUseCase<Unit, ParamCacheCategoryMeals> {
  final CategoryRepository repository;

  CaseCachetCategoryMeals(this.repository);

  @override
  Future<Either<Failure, Unit>> call(param) {
    return Future.value(repository.cacheCategoryMeals(param.name, param.meals));
  }
}

class ParamCacheCategoryMeals {
  final String name;
  final List<Meal> meals;

  ParamCacheCategoryMeals(this.name, this.meals);
}
