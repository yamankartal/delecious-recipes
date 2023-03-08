import 'dart:ui';

import 'package:flutter/material.dart';

import '../../injection.dart';
import '../app_feature/presentation/bloc/app_bloc.dart';
import '../failures/failures.dart';

enum States { init, loading, loaded, error }

class Responsive {
  static double width = 0;
  static double height = 0;
  static double screenHeight = 0;

  static double get font => width * 0.05;

  static double get padding => font / 2;
}

Color primaryColor(Color color) => isDarkTheme ? Colors.black : color;

Color decorationColor(Color color) => isDarkTheme ? Colors.white : color;

Color get styleColor => isDarkTheme ? Colors.black : Colors.white;

bool get isDarkTheme => sl<AppBloc>().state.isDarkTheme;

String errorMsg(Failure failure) {
  if (failure is ServerFailure) return 'There is a server problem';
  if (failure is EmptyDataFailure) return 'There is no data';
  if (failure is ConnectionFailure) return 'No internet connection';
  if (failure is CacheFailure) return 'There is a cache problem';
  if (failure is EmptyCacheFailure) return 'You have not get any data yet';
  return '';
}

SnackBar snackBar(Color color,String errorMg){
  return SnackBar(
    shape: StadiumBorder(
        side: BorderSide(color: decorationColor(color))),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 3),
    backgroundColor: primaryColor(color),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(errorMg,
          style: TextStyle(fontSize: Responsive.font),
        ),
        CircleAvatar(
          backgroundColor: primaryColor(color),
          maxRadius: Responsive.padding * 1.5,
          child: ClipRRect(
              borderRadius:
              BorderRadius.circular(Responsive.padding * 1.5),
              child: Image.asset(
                'assets/images/connection/connection.png',
                fit: BoxFit.cover,
              )),
        ),
      ],
    ),
  );


}

