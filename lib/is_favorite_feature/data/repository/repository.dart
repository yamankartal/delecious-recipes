import 'package:dartz/dartz.dart';
import 'package:delisious_recipes/category_feature/data/model/model.dart';
import 'package:delisious_recipes/core/exceptions/exceptions.dart';
import 'package:delisious_recipes/core/failures/failures.dart';
import 'package:delisious_recipes/is_favorite_feature/data/sources/local.dart';
import 'package:delisious_recipes/is_favorite_feature/domain/repository/repository.dart';

class IsFavoriteRepositoryImp implements IsFavoriteRepository{
  final LocalIsFavorite localIsFavorite;
  IsFavoriteRepositoryImp(this.localIsFavorite);


  @override
  Either<Failure, bool> isFavorite(Meal meal) {
    try{
      return Right(localIsFavorite.isFavorite(meal));
    }
        on CacheException{
      return Left(CacheFailure());
        }
  }

}