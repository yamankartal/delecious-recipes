import 'package:dartz/dartz.dart';
import 'package:delisious_recipes/core/failures/failures.dart';

import '../../data/model/model.dart';
import '../repository/repository.dart';
import 'category_use_case.dart';

class CaseGetCategoryMeals
    extends CategoryUseCase<List<Meal>, ParamGetCategoryMeals> {
  final CategoryRepository repository;

  CaseGetCategoryMeals(this.repository);

  @override
  Future<Either<Failure, List<Meal>>> call(param) async {
    return await repository.getCategoryMeals(param.name);
  }
}

class ParamGetCategoryMeals {
  final String name;

  ParamGetCategoryMeals(this.name);
}
