import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cocktail_flutter/Blocs/HomeBloc.dart';
import 'favorite.dart';
import 'ingredients.dart';
import 'category.dart';
import 'cocktails.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: Consumer<HomeBloc>(
        builder: (context, bloc, child) => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            currentIndex: bloc.selectedIndex,
            onTap: (value) {
              bloc.changeIndex(value);
              bloc.pageController.animateToPage(bloc.selectedIndex,
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.wine_bar), label: 'Cocktails'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.icecream_sharp), label: 'Ingredients'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined), label: 'Category'),
            ],
          ),
          body: SafeArea(
              child: PageView(
            controller: bloc.pageController,
            children: [
              cocktailPage(),
              favoritePage(),
              ingredientPage(),
              categoryPage(),
            ],
          )),
        ),
      ),
    );
  }
}
