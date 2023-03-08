import 'package:dartz/dartz.dart';
import 'package:delisious_recipes/category_feature/data/model/model.dart';
import 'package:delisious_recipes/core/exceptions/exceptions.dart';
import 'package:delisious_recipes/core/failures/failures.dart';

import '../../domain/repository/repository.dart';
import '../souces/local.dart';

class FavoriteRepositoryImpl implements FavoriteRepository{
  final LocalFavorite localFavorite;

  FavoriteRepositoryImpl(this.localFavorite);

  @override
  Either<Failure, List<Meal>> getFavoriteMeals() {
    try{
      List<Meal>meals=localFavorite.getFavoriteMeals();
      if(meals.isEmpty)
        return Left(EmptyCacheFailure());
      return Right(meals);
    }
        on CacheException{
      return
          Left(CacheFailure());
        }
  }

  @override
  Either<Failure, Unit> addToFavorite(Meal meal) {
    try{

         localFavorite.addToFavorite(meal);
      return Right(unit);
    }
        on CacheException{
      return Left(CacheFailure());
        }
  }

  @override
  Either<Failure, Unit> removeFromFavorite(Meal meal) {
    try{

       localFavorite.removeFromFavorite(meal);
      return Right(unit);

    }
    on CacheException{
      return Left(CacheFailure());
    }
  }





}
