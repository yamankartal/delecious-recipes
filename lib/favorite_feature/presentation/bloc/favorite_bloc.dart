import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../category_feature/data/model/model.dart';
import '../../../core/constants/constant.dart';
import '../../domain/use_case/add_to_favorite.dart';
import '../../domain/use_case/get_favorites.dart';
import '../../domain/use_case/remove_from_favorite.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final CaseGetFavorites caseGetFavoriteMeals;
  final CaseAddToFavorite caseAddToFavorite;
  final CaseRemoveFromFavorite caseRemoveFromFavorite;

  FavoriteBloc(
    this.caseGetFavoriteMeals,
    this.caseAddToFavorite,
    this.caseRemoveFromFavorite,
  ) : super(FavoriteState()) {
    on<EventGetFavorite>((event, emit) {
      emit(state.copyWith(getFavoriteMealsState: States.loading));
      final res = caseGetFavoriteMeals.call(ParamGetFavorites());
      res.fold(
          (l) => emit(state.copyWith(
              getFavoriteMealsState: States.error, errorMsg: errorMsg(l))),
          (r) => emit(state.copyWith(
                getFavoriteMealsState: States.loaded,
                favoriteMeals: List.of(r),
              )));
    });

    on<EventAddToFavorite>(
      (event, emit) {
        emit(state.copyWith(favoriteMealStates: States.loading));
        final res = caseAddToFavorite.call(ParamAddToFavorite(event.meal));
        res.fold(
          (l) => emit(state.copyWith(favoriteMealStates: States.error)),
          (r) => emit(
            state.copyWith(
              favoriteMealStates: States.loaded,
              favoriteMeals: List.of(state.favoriteMeals)..add(event.meal),
            ),
          ),
        );
      },
    );

    on<EventRemoveFromFavorite>(
      (event, emit) {
        emit(state.copyWith(favoriteMealStates: States.loading));
        final res =
            caseRemoveFromFavorite.call(ParamRemoveFromFavorite(event.meal));
        res.fold(
          (l) => emit(state.copyWith(favoriteMealStates: States.error)),
          (r) => emit(
            state.copyWith(
              favoriteMealStates: States.loaded,
              favoriteMeals: List.of(state.favoriteMeals)
                ..removeWhere((element) =>
                    element.recipe?.label == event.meal.recipe?.label),
            ),
          ),
        );
      },
    );
  }
}
