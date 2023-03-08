import 'package:delisious_recipes/favorite_feature/domain/repository/repository.dart';
import 'package:delisious_recipes/favorite_feature/domain/use_case/get_favorites.dart';
import 'package:delisious_recipes/favorite_feature/domain/use_case/remove_from_favorite.dart';
import 'package:delisious_recipes/is_favorite_feature/data/repository/repository.dart';
import 'package:delisious_recipes/is_favorite_feature/data/sources/local.dart';
import 'package:delisious_recipes/is_favorite_feature/domain/use_case/is_favorite.dart';
import 'package:delisious_recipes/is_favorite_feature/presentation/bloc/is_favorite_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:delisious_recipes/category_feature/data/model/model.dart';
import 'package:delisious_recipes/core/app_feature/data/sources/local.dart';
import 'package:delisious_recipes/core/app_feature/domain/repository/repository.dart';
import 'package:delisious_recipes/core/app_feature/domain/use_case/change_theme.dart';
import 'package:delisious_recipes/core/app_feature/domain/use_case/is_dark_theme.dart';
import 'package:delisious_recipes/core/app_feature/presentation/bloc/app_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'category_feature/data/repository/repository.dart';
import 'category_feature/data/sources/local.dart';
import 'category_feature/data/sources/remote.dart';
import 'category_feature/domain/repository/repository.dart';
import 'category_feature/domain/use_case/cache_category_meals.dart';
import 'category_feature/domain/use_case/get_cached_category_meals.dart';
import 'category_feature/domain/use_case/get_category_meals.dart';
import 'category_feature/presentation/bloc/category_bloc.dart';
import 'core/app_feature/data/repository/repository.dart';
import 'package:dio/dio.dart';
import 'favorite_feature/data/repository/repository.dart';
import 'favorite_feature/data/souces/local.dart';
import 'favorite_feature/domain/use_case/add_to_favorite.dart';
import 'favorite_feature/presentation/bloc/favorite_bloc.dart';
import 'is_favorite_feature/domain/repository/repository.dart';
final sl=GetIt.instance;

Future<void>init()async{
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(MealAdapter());
  Hive.registerAdapter(RecipeAdapter());
  Hive.registerAdapter(IngredientsAdapter());
  Hive.registerAdapter(TotalNutrientsValueAdapter());

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
//app feature

  //bloc
   sl.registerLazySingleton(() => AppBloc(sl.call(),sl.call()));

   //use case
   sl.registerLazySingleton(() => CaseIsDarkTheme(sl.call()));
   sl.registerLazySingleton(() => CaseChangeTheme(sl.call()));

   //repository
  sl.registerLazySingleton<AppRepository>(() => AppRepositoryImplement(sl.call()));

  //sources
  await Hive.openBox('app');
  Box appBox=Hive.box('app');
  sl.registerLazySingleton(() => LocalApp(appBox));


// category feature

  // bloc
  sl.registerFactory(() => CategoryBloc(sl.call(),sl.call(),sl.call()));

  // use case
  sl.registerLazySingleton(() => CaseGetCachedCategoryMeals(sl.call()));
  sl.registerLazySingleton(() => CaseGetCategoryMeals(sl.call()));
  sl.registerLazySingleton(() => CaseCachetCategoryMeals(sl.call()));

  //repository
  sl.registerLazySingleton<CategoryRepository>(() =>CategoryRepositoryImplement(sl.call(),sl.call(),sl.call()));

  // sources
  await Hive.openBox('category');
  Box categoryBox=Hive.box('category');
  sl.registerLazySingleton(() => LocalCategory(categoryBox));
  sl.registerLazySingleton(() => RemoteCategory(sl.call()));
//favorite feature

  //bloc
  sl.registerFactory(() => FavoriteBloc(sl.call(),sl.call(),sl.call(),));


  //use case
  sl.registerLazySingleton(() => CaseGetFavorites(sl.call()));
  sl.registerLazySingleton(() => CaseAddToFavorite(sl.call()));
  sl.registerLazySingleton(() => CaseRemoveFromFavorite(sl.call()));


  //repository
  sl.registerLazySingleton<FavoriteRepository>(() => FavoriteRepositoryImpl(sl.call()));

  //sources
  await Hive.openBox('favorite');
  Box favoriteBox=Hive.box('favorite');
  sl.registerLazySingleton(() =>LocalFavorite(favoriteBox));

//is favorite feature

  //bloc
  sl.registerFactory(() => IsFavoriteBloc(sl.call()));

  //use case
  sl.registerLazySingleton(() => CaseIsFavorite(sl.call()));

  //repository
  sl.registerLazySingleton<IsFavoriteRepository>(() => IsFavoriteRepositoryImp(sl.call()));

  //source
  sl.registerLazySingleton(() => LocalIsFavorite(favoriteBox));






}