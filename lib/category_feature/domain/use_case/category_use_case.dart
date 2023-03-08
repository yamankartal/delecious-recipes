import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';
abstract class CategoryUseCase<Type,Param>{
  Future<Either<Failure,Type>>call(Param param);
}