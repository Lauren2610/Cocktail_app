import 'dart:math';
import 'cocktail_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:cocktail_flutter/Constants/style.dart';
import 'package:cocktail_flutter/Constants/margin.dart';
import 'package:cocktail_flutter/Constants/String.dart';

import 'package:provider/provider.dart';
import '../Blocs/cocktail_bloc.dart';
import '../data/vos/cocktail_vo.dart';
import 'package:cocktail_flutter/Constants/Widget/cocktail_list_item.dart';

class cocktailPage extends StatefulWidget {
  const cocktailPage({Key? key}) : super(key: key);

  @override
  State<cocktailPage> createState() => _cocktailPageState();
}

class _cocktailPageState extends State<cocktailPage> {
  List<String> cocktailPicPathList = [
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
  List<String> cocktailNameList = [
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

  List<String> cocktailCategoryList = [
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
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CocktailBloc>(
      create: (context) => CocktailBloc(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              SearchView(),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              RecommendedCocktailListView(),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              CocktailListView()
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendedCocktailListView extends StatelessWidget {
  const RecommendedCocktailListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void check(CocktailVO cocktailVO) {
      print(cocktailVO.strDrink);
    }

    return Consumer<CocktailBloc>(
      builder: (context, bloc, child) => (bloc.randomCocktail == null)
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.orangeAccent,
              ),
            )
          : GestureDetector(
              onTap: () {
                check(CocktailVO());

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CocktailDetailPage(
                              cocktailVO: bloc.randomCocktail ?? CocktailVO(),
                            )));
              },
              child: RandomCocktailView(),
            ),
    );
  }
}

class RandomCocktailView extends StatelessWidget {
  const RandomCocktailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CocktailBloc>(
      builder: (context, bloc, child) => (bloc.randomCocktail == null)
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
                color: Colors.orangeAccent,
              ),
            )
          : Container(
              width: 250,
              height: 250,
              child: Stack(
                children: [
                  Image.network(
                    bloc.randomCocktail?.strDrinkThumb ?? '',
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      color: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bloc.randomCocktail?.strDrink ?? '',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            Text(
                              bloc.randomCocktail?.strCategory ?? '',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: kSearch,
        prefixIcon: Icon(Icons.search),
        focusedBorder: kOutlineInputBorder,
        errorBorder: kOutlineInputBorder,
        disabledBorder: kOutlineInputBorder,
        border: kOutlineInputBorder,
      ),
    );
  }
}

class CocktailListView extends StatelessWidget {
  const CocktailListView({
    super.key,
  });

  // final List<String> cocktailNameList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              CocktailListItem(cocktailVO: CocktailVO());
            }));
  }
}
