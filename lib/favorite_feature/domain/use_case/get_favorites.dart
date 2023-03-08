import 'package:dartz/dartz.dart';
import 'package:delisious_recipes/core/failures/failures.dart';

import '../../../category_feature/data/model/model.dart';
import '../repository/repository.dart';
import 'favorite_use_case.dart';

class CaseGetFavorites extends FavoriteUseCase<List<Meal>,ParamGetFavorites>{
  final FavoriteRepository repository;
  CaseGetFavorites(this.repository);

  @override
  Either<Failure,List<Meal>> call(ParamGetFavorites param) {
    return repository.getFavoriteMeals();
  }


}

class ParamGetFavorites{

}