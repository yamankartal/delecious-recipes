part of 'app_bloc.dart';

class AppState {
  final States isDarkThemeState;
  final States changeThemeState;
  final bool isDarkTheme;

  AppState(
      {this.isDarkTheme = false,
      this.isDarkThemeState = States.init,
      this.changeThemeState = States.init});

  AppState copyWith(
      {final bool? isDarkTheme,
      final States? isDarkThemeState,
      final States? changeThemeState}) {
    return AppState(isDarkTheme: isDarkTheme ?? this.isDarkTheme,

    isDarkThemeState: isDarkThemeState??this.isDarkThemeState,
      changeThemeState: changeThemeState??this.changeThemeState,
    );
  }
}
