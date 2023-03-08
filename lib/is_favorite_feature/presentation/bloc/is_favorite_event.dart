part of 'is_favorite_bloc.dart';

@immutable
abstract class IsFavoriteEvent {}

class EventIsFavorite extends IsFavoriteEvent {
  final Meal meal;

  EventIsFavorite(this.meal);
}
