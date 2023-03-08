part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}
class EventGetFavorite extends FavoriteEvent{}
class EventAddToFavorite extends  FavoriteEvent{
  final Meal meal;
  EventAddToFavorite(this.meal);
}
class EventRemoveFromFavorite extends  FavoriteEvent{
  final Meal meal;
  EventRemoveFromFavorite(this.meal);
}

