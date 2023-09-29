import 'package:flutter/material.dart';
import 'package:cocktail_flutter/Constants/style.dart';
import 'package:cocktail_flutter/Constants/margin.dart';
import 'package:cocktail_flutter/Constants/String.dart';
import 'package:cocktail_flutter/Constants/widgets.dart';
import 'package:provider/provider.dart';
import 'package:cocktail_flutter/Blocs/FavoriteBloc.dart';

class favoritePage extends StatelessWidget {
  const favoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> cocktailFavPicPathList = [
      "Images/Margarita.jpg",
      "Images/Margarita.jpg",
      "Images/Margarita.jpg",
      "Images/Margarita.jpg",
      "Images/Margarita.jpg",
      "Images/Margarita.jpg",
      "Images/Margarita.jpg",
      "Images/Margarita.jpg",
      "Images/Margarita.jpg",
      "Images/Margarita.jpg",
      "Images/Margarita.jpg",
      "Images/Margarita.jpg",
    ];
    List<String> cocktailFavNameList = [
      "Cocktail Name",
      "Cocktail Name",
      "Cocktail Name",
      "Cocktail Name",
      "Cocktail Name",
      "Cocktail Name",
      "Cocktail Name",
      "Cocktail Name",
      "Cocktail  Name",
      "Cocktail Name",
      "Cocktail Name",
      "Cocktail Name",
    ];

    List<String> cocktailFavCategoryList = [
      "Cocktail Category",
      "Cocktail Category",
      "Cocktail Category",
      "Cocktail Category",
      "Cocktail Category",
      " Cocktail Category",
      "Cocktail Category",
      "Cocktail Category",
      "Cocktail Category",
      "Cocktail Category",
      "Cocktail Category",
      " Cocktail Category",
    ];
    return ChangeNotifierProvider<FavoriteBloc>(
      create: (context) => FavoriteBloc(),
      child: Consumer<FavoriteBloc>(
        builder: (context, bloc, child) => Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.all(20),
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
                    child: ListView.builder(
                        itemCount: cocktailFavNameList.length,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Image.asset(
                                      "${cocktailFavPicPathList[index]}"),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50.0),
                                      bottomLeft: Radius.circular(50.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 13, vertical: 17),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            cocktailFavNameList[index],
                                            style: TextStyle(fontSize: 19.0),
                                          ),
                                          Spacer(),
                                          Text(
                                            cocktailFavCategoryList[index],
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.grey.shade600),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      GestureDetector(
                                        child: bloc.heartSelected
                                            ? Icon(Icons.favorite_border)
                                            : Icon(Icons.favorite),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
