import 'package:delisious_recipes/categories_feature/constants/constants.dart';
import 'package:delisious_recipes/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../category_feature/presentation/bloc/category_bloc.dart';
import '../../../category_feature/presentation/screens/category_screen.dart';
import '../../../core/app_feature/presentation/bloc/app_bloc.dart';
import '../../../core/constants/constant.dart';
import '../../../favorite_feature/presentation/bloc/favorite_bloc.dart';
import '../../../favorite_feature/presentation/screens/favorite_meals_screen.dart';
import '../widgets/category_item_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late AppBloc appBloc;
  late FavoriteBloc favoriteBloc;

  @override
  void initState() {
    appBloc = sl<AppBloc>();
    favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    appBloc.add(EventChangeTheme());
                  },
                  icon: Icon(Icons.sunny))
            ],
            title: Text('Categories'),
          ),

          body: Container(
            width: Responsive.width,
            height: Responsive.height,
            child: GridView(
              padding: EdgeInsets.symmetric(
                vertical: Responsive.padding,
                horizontal: Responsive.padding,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: Responsive.font * 1.3 / Responsive.font,
                crossAxisCount: 2,
                crossAxisSpacing: Responsive.padding,
                mainAxisSpacing: Responsive.padding,
              ),
              children: categories
                  .map(
                    (e) => InkWell(
                      child: CategoryItemWidget(
                        image: e.image,
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .push(
                              MaterialPageRoute(
                                builder: (_) => MultiBlocProvider(
                                  providers: [
                                    BlocProvider(
                                      create: (_) => sl<CategoryBloc>(),
                                    ),
                                    BlocProvider.value(value: favoriteBloc),
                                  ],
                                  child: CategoryScreen(
                                      name: e.name, color: e.color),
                                ),
                              ),
                            )
                            .then((value) => ScaffoldMessenger.of(context)
                                .removeCurrentSnackBar());
                      },
                    ),
                  )
                  .toList(),
            ),
          ),

          floatingActionButton: CircleAvatar(
            maxRadius: Responsive.font * 1.65,
            backgroundColor:Colors.white,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: favoriteBloc,
                      child: FavoriteMealsScreen(),
                    ),
                  ),
                );
              },
              child: Icon(Icons.favorite_border,color: Colors.white,),
            ),
          ),
        );
  }
}
