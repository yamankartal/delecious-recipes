import 'package:delisious_recipes/core/app_feature/presentation/bloc/app_bloc.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../categories_feature/presentation/screens/categories_screen.dart';
import '../../core/constants/constant.dart';
import '../../favorite_feature/presentation/bloc/favorite_bloc.dart';
import '../../injection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AppBloc appBloc;

  @override
  void initState() {
    appBloc = sl<AppBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive.width = MediaQuery.of(context).size.width;
    Responsive.screenHeight = MediaQuery.of(context).size.height;
    Responsive.height = Responsive.screenHeight -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
          body: EasySplashScreen(
            logo: Image.asset('assets/images/splash/splash.jpg'),
            logoWidth: 0,
            backgroundImage: AssetImage('assets/images/splash/splash.jpg'),
            showLoader: false,
            navigator: appBloc.state.isDarkThemeState == States.loaded
                ? BlocProvider(
                    create: (_) => sl<FavoriteBloc>(),
                    child: CategoriesScreen(),
                  )
                : Scaffold(
                    body: Container(
                      width: Responsive.width,
                      height: Responsive.screenHeight,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/splash/splash.jpg'),
                        ),
                      ),
                    ),
                  ),
          ),


    );
  }
}
