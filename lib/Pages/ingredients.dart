import 'package:cocktail_flutter/Constants/style.dart';
import 'package:flutter/material.dart';
import 'package:cocktail_flutter/Constants/margin.dart';
import 'package:cocktail_flutter/Constants/String.dart';

class ingredientPage extends StatefulWidget {
  const ingredientPage({Key? key}) : super(key: key);

  @override
  State<ingredientPage> createState() => _ingredientPageState();
}

class _ingredientPageState extends State<ingredientPage> {
  List<String> ingredientList = [
    "Cocktail 1",
    "Cocktail 2",
    "Cocktail 3",
    "Cocktail 4",
    "Cocktail 5",
    "Cocktail 6",
    "Cocktail 7",
    "Cocktail 8",
    "Cocktail 9",
    "Cocktail 10",
    "Cocktail 11",
    "Cocktail 12",
    "Cocktail 13",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              kIngredients,
              style: kIngredientTopicStyle,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ingredientList.length,
              itemBuilder: (context, index) {
                return Container(
                  height: MARGIN_XXXLARGE,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.orange,
                  ),
                  margin: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      ingredientList[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
