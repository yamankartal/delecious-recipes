import 'package:delisious_recipes/core/app_feature/presentation/screens/home_Screen.dart';
import 'package:flutter/cupertino.dart';

import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    HomeScreen(),
  );
}
