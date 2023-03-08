import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';
abstract class FavoriteUseCase<Type,Param>{
  Either<Failure,Type>call(Param param);
}