import '../../../core/failures/failures.dart';
import '../../data/model/model.dart';
import 'package:dartz/dartz.dart';
abstract class CategoryRepository{
  Future<Either<Failure,List<Meal>>>getCategoryMeals(String name);
  Either<Failure,Unit>cacheCategoryMeals(String name,List<Meal>meals);
  Either<Failure,List<Meal>>getCachedCategoryMeals(String name);
}