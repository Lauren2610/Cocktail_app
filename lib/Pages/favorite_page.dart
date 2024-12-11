import 'package:cocktail_flutter/Constants/Widget/cocktail_list_item.dart';
import 'package:flutter/material.dart';
import 'package:cocktail_flutter/Constants/style.dart';
import 'package:cocktail_flutter/Constants/margin.dart';
import 'package:cocktail_flutter/Constants/String.dart';

import 'package:provider/provider.dart';
import 'package:cocktail_flutter/Blocs/FavoriteBloc.dart';

class favoritePage extends StatelessWidget {
  const favoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FavoriteBloc>(
      create: (context) => FavoriteBloc(),
      child: Consumer<FavoriteBloc>(
        builder: (context, bloc, child) => Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    kFavorite,
                    style: kIngredientTopicStyle,
                  ),
                  SizedBox(
                    height: MARGIN_MEDIUM_3,
                  ),
                  Expanded(
                    child: (bloc.favouriteCocktailList == null)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: bloc.favouriteCocktailList!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  height: 80,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Colors.yellow.shade200,
                                  ),

                                  // padding: const EdgeInsets.symmetric(
                                  //     horizontal: 13, vertical: 17),
                                  child: CocktailListItem(
                                    cocktailVO:
                                        bloc.favouriteCocktailList![index],
                                    ontapFavorite: () {
                                      bloc.makeCocktailFavourite(
                                          id: bloc.favouriteCocktailList![index]
                                                  .idDrink ??
                                              '',
                                          isFavorite: !(bloc
                                                  .favouriteCocktailList![index]
                                                  .isFavorite ??
                                              false));
                                    },
                                  ));
                            }),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
