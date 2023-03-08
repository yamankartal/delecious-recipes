import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../category_feature/data/model/model.dart';
import '../../../core/constants/constant.dart';
import '../../domain/use_case/is_favorite.dart';

part 'is_favorite_event.dart';

part 'is_favorite_state.dart';

class IsFavoriteBloc extends Bloc<IsFavoriteEvent, IsFavoriteState> {
  final CaseIsFavorite caseIsFavorite;

  IsFavoriteBloc(this.caseIsFavorite) : super(IsFavoriteState()) {
    on<EventIsFavorite>((event, emit) {
      emit(state.copyWith(isFavoriteState: States.loading));
      final res = caseIsFavorite.call(ParamIsFavorite(event.meal));
      res.fold(
          (l) => emit(state.copyWith(isFavoriteState: States.error)),
          (r) => emit(
              state.copyWith(isFavoriteState: States.loaded, isFavorite: r)));
    });
  }
}
