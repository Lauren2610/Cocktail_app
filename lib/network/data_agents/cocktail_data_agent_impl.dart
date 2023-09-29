import 'package:dio/dio.dart';
import 'package:cocktail_flutter/network/response/category_list_response.dart';
import 'cocktail_data_agent.dart';
import 'package:cocktail_flutter/network/constants/network_constants.dart';

class CocktailDataAgentImpl implements CocktailDataAgent {
  late Dio dio;
  static final CocktailDataAgentImpl _singleton =
      CocktailDataAgentImpl.internal();

  factory CocktailDataAgentImpl() {
    return _singleton;
  }

  CocktailDataAgentImpl.internal() {
    dio = Dio();
  }
  @override
  Future<CategoryListResponse?> getCategoryList() async {
    var responses = await dio.get('$BASE_URL/list.php?c=list');

    CategoryListResponse? categoryListRes =
        CategoryListResponse.fromJson(responses.data as Map<String, dynamic>);
    return Future.value(categoryListRes);
  }
}
