import 'package:dartz/dartz.dart';
import 'package:delisious_recipes/core/app_feature/domain/repository/repository.dart';
import 'package:delisious_recipes/core/app_feature/domain/use_case/use_case.dart';
import 'package:delisious_recipes/core/failures/failures.dart';

class CaseChangeTheme extends AppUseCase<Unit, ParamChangeTheme> {
  final AppRepository repository;

  CaseChangeTheme(this.repository);

  @override
  Either<Failure, Unit> call(param) {
    return repository.changeTheme();
  }
}

class ParamChangeTheme {}
