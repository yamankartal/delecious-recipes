import '../../../core/failures/failures.dart';
import 'package:dartz/dartz.dart';
abstract class IsFavoriteUseCase<Type,Param>{
  Either<Failure,Type>call(Param param);
}