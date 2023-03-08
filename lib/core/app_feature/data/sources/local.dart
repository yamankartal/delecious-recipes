import 'package:delisious_recipes/core/failures/failures.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalApp {
  final Box appBox;

  LocalApp(this.appBox);

  bool isDarkTheme() {
    try {
      return appBox.get('theme') ?? false;
    } catch (e) {
      throw CacheFailure();
    }
  }

  void changeTheme() {
    try {
      appBox.put('theme', !isDarkTheme());
    } catch (e) {
      throw CacheFailure();
    }
  }
}
