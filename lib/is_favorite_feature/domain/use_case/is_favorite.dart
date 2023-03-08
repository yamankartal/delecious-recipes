import 'package:dartz/dartz.dart';
import 'package:delisious_recipes/core/failures/failures.dart';
import 'package:delisious_recipes/is_favorite_feature/domain/repository/repository.dart';
import 'package:delisious_recipes/is_favorite_feature/domain/use_case/use_case.dart';

import '../../../category_feature/data/model/model.dart';

class CaseIsFavorite extends IsFavoriteUseCase<bool, ParamIsFavorite> {
  final IsFavoriteRepository isFavoriteRepository;

  CaseIsFavorite(this.isFavoriteRepository);

  @override
  Either<Failure, bool> call(param) {
    return isFavoriteRepository.isFavorite(param.meal);
  }
}

class ParamIsFavorite {
  final Meal meal;

  ParamIsFavorite(this.meal);
}
