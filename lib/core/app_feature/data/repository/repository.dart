import 'package:dartz/dartz.dart';
import 'package:delisious_recipes/core/app_feature/data/sources/local.dart';
import 'package:delisious_recipes/core/app_feature/domain/repository/repository.dart';
import 'package:delisious_recipes/core/exceptions/exceptions.dart';
import 'package:delisious_recipes/core/failures/failures.dart';

class AppRepositoryImplement extends AppRepository {
  final LocalApp localApp;

  AppRepositoryImplement(this.localApp);

  @override
  Either<Failure, Unit> changeTheme() {
    try {
      localApp.changeTheme();
      return Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Either<Failure, bool> isDarkTheme() {
    try {
      return Right(localApp.isDarkTheme());
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
