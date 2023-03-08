import 'package:dartz/dartz.dart';

import '../../../category_feature/data/model/model.dart';
import '../../../core/failures/failures.dart';

abstract class IsFavoriteRepository {
  Either<Failure, bool> isFavorite(Meal meal);
}
