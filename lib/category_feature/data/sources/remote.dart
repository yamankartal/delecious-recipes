import 'package:dio/dio.dart';

import '../../../core/failures/failures.dart';
import '../model/model.dart';

class RemoteCategory {
  final Dio dio;

  RemoteCategory(this.dio);

  Future<List<Meal>> getCategoryMeals(String name) async {
    try {
      final response = await dio.get(
          'https://edamam-recipe-search.p.rapidapi.com/search?q=$name',
          options: Options(headers: {
            "X-RapidAPI-Key":
                "24eaed98b0msh37735b295882d00p176b24jsn36629151acf2",
            "X-RapidAPI-Host": "edamam-recipe-search.p.rapidapi.com",
          }));
      if (response.statusCode != 200) {
        throw ServerFailure();
      }
      Map<String, dynamic> res = response.data;

      CategoryModel categoryModel = CategoryModel.fromJson(res);

      return categoryModel.meals ??<Meal> [];
    } catch (e) {
      throw ServerFailure();
    }
  }
}
