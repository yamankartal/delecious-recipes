import 'package:dartz/dartz.dart';
import 'package:delisious_recipes/category_feature/data/model/model.dart';
import 'package:delisious_recipes/core/failures/failures.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../domain/repository/repository.dart';
import '../sources/local.dart';
import '../sources/remote.dart';

class CategoryRepositoryImplement implements CategoryRepository {
  final LocalCategory localCategory;
  final RemoteCategory remoteCategory;
  final InternetConnectionChecker internetConnectionChecker;

  CategoryRepositoryImplement(
      this.localCategory, this.remoteCategory, this.internetConnectionChecker);

  @override
  Future<Either<Failure, List<Meal>>> getCategoryMeals(String name) async {
    try {
      if (await internetConnectionChecker.hasConnection) {
        List<Meal> meals = await remoteCategory.getCategoryMeals(name);
        if (meals.isEmpty) {
          return Left(EmptyDataFailure());
        }
        return Right(meals);
      } else {
        return Left(ConnectionFailure());
      }
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Unit> cacheCategoryMeals(String name, List<Meal> meals) {
    try {
      localCategory.cacheCategoryMeals(name, meals);
      return Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Either<Failure, List<Meal>> getCachedCategoryMeals(String name) {
    try {
      List<Meal> meals = localCategory.getCachedCategoryMeals(name);
      if (meals.isEmpty) return Left(EmptyCacheFailure());
      return Right(meals);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
