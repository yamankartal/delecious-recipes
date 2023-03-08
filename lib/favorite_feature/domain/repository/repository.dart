import '../../../category_feature/data/model/model.dart';
import '../../../core/failures/failures.dart';
import 'package:dartz/dartz.dart';
abstract class FavoriteRepository{
  Either<Failure,Unit>addToFavorite(Meal meal);
  Either<Failure,Unit>removeFromFavorite(Meal meal);
  Either<Failure,List<Meal>>getFavoriteMeals();

}