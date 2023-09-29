import 'package:dio/dio.dart';
import 'package:cocktail_flutter/network/data_agents/cocktail_data_agent.dart';
import 'package:cocktail_flutter/network/data_agents/cocktail_data_agent_impl.dart';
import 'package:dio/dio.dart';
import 'package:cocktail_flutter/data/vos/category_vo.dart';
import 'cocktail_model.dart';

class CocktailModelImpl implements CocktailModel {
  late CocktailDataAgent dataAgent;
  static final CocktailModelImpl _singleton = CocktailModelImpl.internal();

  factory CocktailModelImpl() {
    return _singleton;
  }

  CocktailModelImpl.internal() {
    dataAgent = CocktailDataAgentImpl();
  }

  @override
  Future<List<CategoryVO>?> getCategoryListFromNetwork() {
    return dataAgent.getCategoryList().then((categoryListRes) {
      return categoryListRes?.category_list;
    });
  }
}
