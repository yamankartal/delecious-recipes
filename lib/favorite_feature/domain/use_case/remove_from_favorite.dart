import 'package:dartz/dartz.dart';
import 'package:delisious_recipes/core/failures/failures.dart';

import '../../../category_feature/data/model/model.dart';
import '../repository/repository.dart';
import 'favorite_use_case.dart';

class CaseRemoveFromFavorite extends FavoriteUseCase<Unit,ParamRemoveFromFavorite>{
  final FavoriteRepository repository;
  CaseRemoveFromFavorite(this.repository);


  @override
  Either<Failure,Unit> call(param) {
    return repository.removeFromFavorite(param.meal);
  }
}




class ParamRemoveFromFavorite{
  final Meal meal;
  ParamRemoveFromFavorite(this.meal);


}