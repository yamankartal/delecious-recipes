import 'package:dartz/dartz.dart';

import '../../../failures/failures.dart';

abstract class AppUseCase<Type, Param> {
  Either<Failure, Type> call(Param param);
}
