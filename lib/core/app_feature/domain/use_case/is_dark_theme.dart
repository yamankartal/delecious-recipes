import 'package:dartz/dartz.dart';
import 'package:delisious_recipes/core/app_feature/domain/repository/repository.dart';
import 'package:delisious_recipes/core/app_feature/domain/use_case/use_case.dart';
import 'package:delisious_recipes/core/failures/failures.dart';

class CaseIsDarkTheme extends AppUseCase<bool, ParamIsDarkTheme> {
  final AppRepository repository;

  CaseIsDarkTheme(this.repository);

  @override
  Either<Failure, bool> call(param) {
    return repository.isDarkTheme();
  }
}

class ParamIsDarkTheme {}
