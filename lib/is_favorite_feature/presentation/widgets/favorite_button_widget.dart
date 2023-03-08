import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../category_feature/data/model/model.dart';
import '../../../core/constants/constant.dart';
import '../../../favorite_feature/presentation/bloc/favorite_bloc.dart';
import '../bloc/is_favorite_bloc.dart';

class FavoriteButtonWidget extends StatelessWidget {
  final Meal meal;
  final FavoriteBloc favoriteMealsBloc;
  final IsFavoriteBloc isFavoriteBloc;
  final Color color;

  const FavoriteButtonWidget(
      {Key? key,
      required this.meal,
      required this.favoriteMealsBloc,
      required this.isFavoriteBloc,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
        buildWhen: (p, c) =>p.favoriteMealStates!=c.favoriteMealStates&& c.favoriteMealStates==States.loaded,
        builder: (_, s) {
          if (s.favoriteMealStates == States.loaded ||
              s.favoriteMealStates == States.init) {

            isFavoriteBloc.add(EventIsFavorite(meal));

            return BlocBuilder<IsFavoriteBloc, IsFavoriteState>(
                buildWhen: (p, c) => p.isFavoriteState!=c.isFavoriteState&&  c.isFavoriteState==States.loaded,

                builder: (_, s) {

                  if (s.isFavoriteState == States.loaded) {
                    return InkWell(
                        onTap: () {
                          if (s.isFavorite)
                            favoriteMealsBloc
                                .add(EventRemoveFromFavorite(meal));
                          else
                            favoriteMealsBloc.add(EventAddToFavorite(meal));
                        },
                        child: Icon(
                            s.isFavorite ? Icons.star : Icons.star_border,
                            size: Responsive.font * 2.2,
                            color: primaryColor(color),
                        ),
                    );
                  }
                  return Icon(s.isFavorite?Icons.star:Icons.star_border);
                },
            );
          }
          return Container();
        },
    );
  }
}
