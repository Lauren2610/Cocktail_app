import 'package:cocktail_flutter/Constants/style.dart';
import 'package:flutter/material.dart';
import 'package:cocktail_flutter/Constants/margin.dart';
import 'package:cocktail_flutter/Constants/String.dart';
import 'package:cocktail_flutter/Constants/widgets.dart';
import 'package:cocktail_flutter/data/vos/cocktail_vo.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({Key? key, this.cocktailVO}) : super(key: key);
  final CocktailVO? cocktailVO;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent.shade100,
      appBar: AppBar(backgroundColor: Colors.orange),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                    child: Image.network(
                      cocktailVO?.strDrinkThumb ?? '',
                      width: 180,
                      height: 180,
                    ),
                  ),
                  SizedBox(
                    width: MARGIN_MEDIUM,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            cocktailVO?.strDrink ?? '',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MARGIN_MEDIUM,
                          ),
                          Text(
                            cocktailVO?.strCategory ?? '',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MARGIN_MEDIUM_3,
              ),
              InfoTextView(
                title: 'Glass',
                text: cocktailVO?.strGlass ?? '',
              ),
              const SizedBox(
                height: MARGIN_MEDIUM,
              ),
              InfoTextView(
                title: 'Is ALcoholic',
                text: cocktailVO?.strAlcoholic ?? '',
              ),
              SizedBox(
                height: MARGIN_MEDIUM_3,
              ),
              Text(
                'Ingredients',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              SizedBox(
                height: MARGIN_MEDIUM_3,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount:
                    cocktailVO?.getIngredientAndMeasureList().length ?? 0,
                itemBuilder: (context, index) {
                  Map<String?, String?> ingredients =
                      cocktailVO?.getIngredientAndMeasureList() ?? {};
                  return InfoTextView(
                    title: ingredients.keys.toList()[index] ?? '',
                    text: ingredients.values.toList()[index] ?? '',
                  );
                },
              ),
              SizedBox(
                height: MARGIN_MEDIUM_3,
              ),
              Text(
                'Instructions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              SizedBox(
                height: MARGIN_MEDIUM_3,
              ),
              Text(
                cocktailVO?.strInstructions ?? '',
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoTextView extends StatelessWidget {
  InfoTextView({super.key, required this.title, required this.text});
  String title;
  String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0
              // ingredients.keys.toList()[index] ?? ''
              ),
        ),
        Spacer(),
        Text(
          text,
          style: TextStyle(fontSize: 15.0
              // ingredients.keys.toList()[index] ?? ''
              ),
        ),
      ],
    );
  }
}
