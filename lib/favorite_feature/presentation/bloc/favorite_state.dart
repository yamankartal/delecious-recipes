part of 'favorite_bloc.dart';

class FavoriteState{
  final List<Meal>favoriteMeals;
  final States getFavoriteMealsState;
  final String errorMsg;
  final States favoriteMealStates;

  FavoriteState({this.errorMsg='',this.favoriteMeals=const[], this.getFavoriteMealsState=States.init,this.favoriteMealStates=States.init,});


  FavoriteState copyWith({

    final String ?errorMsg,
    final List<Meal>?favoriteMeals,
    final States ?getFavoriteMealsState,
    final States ?favoriteMealStates,
}){
    return FavoriteState(

      errorMsg: errorMsg??this.errorMsg,
      favoriteMeals: favoriteMeals??this.favoriteMeals,
      getFavoriteMealsState: getFavoriteMealsState??this.getFavoriteMealsState,
      favoriteMealStates: favoriteMealStates??this.favoriteMealStates,
    );
  }

}
