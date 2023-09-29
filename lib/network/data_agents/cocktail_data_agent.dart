import 'cocktail_data_agent.dart';
import 'package:cocktail_flutter/network/response/category_list_response.dart';

abstract class CocktailDataAgent {
  Future<CategoryListResponse?> getCategoryList();
}
