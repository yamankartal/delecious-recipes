part of 'is_favorite_bloc.dart';

class IsFavoriteState {
  final bool isFavorite;
  final States isFavoriteState;

  IsFavoriteState(
      {this.isFavorite = false, this.isFavoriteState = States.init});

  IsFavoriteState copyWith({
    final bool? isFavorite,
    final States? isFavoriteState,
  }) {
    return IsFavoriteState(
      isFavorite: isFavorite ?? this.isFavorite,
      isFavoriteState: isFavoriteState ?? this.isFavoriteState,
    );
  }
}
