import 'package:delisious_recipes/core/app_feature/presentation/bloc/app_bloc.dart';
import 'package:delisious_recipes/splash_feature/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../../constants/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AppBloc appBloc;

  @override
  void initState() {
    appBloc = sl<AppBloc>();
    appBloc.add(EventIsDarkTheme());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (p,c)=>p.isDarkThemeState!=c.isDarkThemeState||p.changeThemeState!=c.changeThemeState&&c.changeThemeState==States.loaded,
      bloc: appBloc,
      builder: (_, s)=>
         MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        themeMode: s.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData(
            appBarTheme:
                AppBarTheme(backgroundColor: Colors.deepOrange.shade900),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              iconSize: Responsive.font * 1.5,
              backgroundColor: Colors.deepOrange.shade900,
            ),
            primaryColor: Colors.deepOrange.shade900,
            canvasColor: Colors.white),
        darkTheme: ThemeData(
            appBarTheme: AppBarTheme(
                shadowColor: Colors.white, backgroundColor: Colors.black),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.black,
              iconSize: Responsive.font * 1.5,
            ),
            primaryColor: Colors.deepOrange.shade900,
            canvasColor: Colors.black),
      )
    );
  }
}
