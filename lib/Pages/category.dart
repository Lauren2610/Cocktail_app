import 'package:cocktail_flutter/data/vos/category_vo.dart';
import 'package:flutter/material.dart';
import 'package:cocktail_flutter/Constants/style.dart';
import 'package:cocktail_flutter/Constants/margin.dart';
import 'package:cocktail_flutter/Constants/String.dart';
import 'package:cocktail_flutter/data/models/cocktail_model_impl.dart';
import 'package:cocktail_flutter/Blocs/category_bloc.dart';
import 'package:provider/provider.dart';

class categoryPage extends StatefulWidget {
  const categoryPage({Key? key}) : super(key: key);

  @override
  State<categoryPage> createState() => _categoryPageState();
}

class _categoryPageState extends State<categoryPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryBloc>(
      create: (context) => CategoryBloc(),
      child: Consumer<CategoryBloc>(
        builder: (context, bloc, child) => Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  kCategory,
                  style: kIngredientTopicStyle,
                ),
              ),
              Expanded(
                  child: Consumer<CategoryBloc>(
                      builder: (context, bloc, child) => (bloc.categoryList ==
                              null)
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.orangeAccent,
                              ),
                            )
                          : GridView.builder(
                              itemCount: bloc.categoryList!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,

                                // et the number of columns to 2
                              ),
                              itemBuilder: (context, index) {
                                CategoryVO temp = bloc.categoryList![index];
                                return Container(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        temp.category ?? '',
                                        textAlign: TextAlign.center,
                                      )),
                                  height: MARGIN_XXXLARGE,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Colors.orange,
                                  ),
                                  margin: EdgeInsets.all(10.0),
                                );
                              })))
            ],
          ),
        ),
      ),
    );
  }
}
