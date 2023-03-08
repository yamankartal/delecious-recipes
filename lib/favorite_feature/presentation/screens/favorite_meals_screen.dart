import 'package:delisious_recipes/is_favorite_feature/presentation/bloc/is_favorite_bloc.dart';
import 'package:delisious_recipes/meal_details_feature/presentation/screens/meal_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/constant.dart';
import '../../../injection.dart';
import '../bloc/favorite_bloc.dart';
import '../widgets/favorite_item_widget.dart';

class FavoriteMealsScreen extends StatefulWidget {
  const FavoriteMealsScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteMealsScreen> createState() => _FavoriteMealsScreenState();
}

class _FavoriteMealsScreenState extends State<FavoriteMealsScreen> {
  late FavoriteBloc favoriteBloc;

  @override
  void initState() {
    favoriteBloc= BlocProvider.of<FavoriteBloc>(context);
    favoriteBloc.add(EventGetFavorite());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        buildWhen: (p, c) =>
        p.getFavoriteMealsState != c.getFavoriteMealsState ||
            c.favoriteMealStates == States.loaded,
        bloc:favoriteBloc,
        builder: (_, s) {
          if (s.getFavoriteMealsState == States.loading) {
            return Center(child: CircularProgressIndicator());
          }

          else if (s.getFavoriteMealsState == States.loaded) {
            return s.favoriteMeals.isEmpty
                ? Center(
                child: Text(
                  'There is no favorite Meals',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: Responsive.font * 2,
                      color: decorationColor(Colors.deepOrange.shade900)),
                ))
                : ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.font,
                  vertical: Responsive.font,
                ),
                itemBuilder: (_, index) =>
                    BlocProvider(
                      create: (context) =>sl<IsFavoriteBloc>(),
                      child: Builder(
                          builder: (context) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        MultiBlocProvider(
                                          providers: [
                                            BlocProvider.value(value:favoriteBloc),
                                           BlocProvider.value(value: BlocProvider.of<IsFavoriteBloc>(context))
                                          ],
                                          child: MealDetailsScreen(
                                              color: Colors.deepOrange.shade900,
                                              meal: s.favoriteMeals[index]),
                                        ),
                                  ),
                                );
                              },
                              child: FavoriteItemWidget(
                                  color: Colors.deepOrange.shade900,
                                  image: s.favoriteMeals[index].recipe!.image
                                      .toString(),
                                  label: s.favoriteMeals[index].recipe!.label
                                      .toString()),
                            );
                          }
                      ),
                    ),
                separatorBuilder: (_, index) =>
                    SizedBox(height: Responsive.font),
                itemCount: s.favoriteMeals.length);
          }

          else if (s.getFavoriteMealsState == States.error) {
            return Center(
              child: Text(
                s.errorMsg,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: Responsive.font * 2,
                    color: decorationColor(Colors.deepOrange.shade900)),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
