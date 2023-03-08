import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/constant.dart';
import '../../domain/use_case/change_theme.dart';
import '../../domain/use_case/is_dark_theme.dart';

part 'app_event.dart';



part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final CaseIsDarkTheme caseIsDarkTheme;
  final CaseChangeTheme caseChangeTheme;

  AppBloc(this.caseIsDarkTheme, this.caseChangeTheme) : super(AppState()) {

    on<EventIsDarkTheme>((event, emit) {
      emit(state.copyWith(isDarkThemeState: States.loading));
      final res = caseIsDarkTheme.call(ParamIsDarkTheme());
      res.fold(
              (l) => emit(state.copyWith(isDarkThemeState: States.error)),
              (r) =>
              emit(
                  state.copyWith(
                      isDarkThemeState: States.loaded, isDarkTheme: r)));
    });

    on<EventChangeTheme>((event, emit) {
      emit(state.copyWith(changeThemeState: States.loading));
      final res = caseChangeTheme.call(ParamChangeTheme());
      res.fold(
              (l) => emit(state.copyWith(changeThemeState: States.error)),
              (r) =>
              emit(state.copyWith(
                  changeThemeState: States.loaded,
                  isDarkTheme: !state.isDarkTheme)));
    });
  }
}
