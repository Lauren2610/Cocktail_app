import 'package:cocktail_flutter/data/vos/category_vo.dart';

abstract class CocktailModel {
  Future<List<CategoryVO>?> getCategoryListFromNetwork();
}
