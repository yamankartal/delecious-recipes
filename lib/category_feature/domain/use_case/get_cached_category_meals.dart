import 'package:dartz/dartz.dart';
import 'package:delisious_recipes/core/failures/failures.dart';

import '../../data/model/model.dart';
import '../repository/repository.dart';
import 'category_use_case.dart';

class CaseGetCachedCategoryMeals
    extends CategoryUseCase<List<Meal>, ParamGetCacheCategoryMeals> {
  final CategoryRepository repository;

  CaseGetCachedCategoryMeals(this.repository);

  @override
  Future<Either<Failure, List<Meal>>> call(param) {
    return Future.value(repository.getCachedCategoryMeals(param.name));
  }
}

class ParamGetCacheCategoryMeals {
  final String name;

  ParamGetCacheCategoryMeals(
    this.name,
  );
}
