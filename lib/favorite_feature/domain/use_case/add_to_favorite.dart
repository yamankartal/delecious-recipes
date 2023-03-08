import 'package:dartz/dartz.dart';
import 'package:delisious_recipes/core/failures/failures.dart';

import '../../../category_feature/data/model/model.dart';
import '../repository/repository.dart';
import 'favorite_use_case.dart';

class CaseAddToFavorite extends FavoriteUseCase<Unit,ParamAddToFavorite>{

  final FavoriteRepository repository;
  CaseAddToFavorite(this.repository);

  @override
  Either<Failure,Unit> call(param) {
    return repository.addToFavorite(param.meal);
  }
}

class ParamAddToFavorite{
  final Meal meal;
  ParamAddToFavorite(this.meal);


}