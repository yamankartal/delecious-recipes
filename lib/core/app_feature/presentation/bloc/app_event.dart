part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}
class EventIsDarkTheme extends AppEvent{}
class EventChangeTheme extends AppEvent{}
