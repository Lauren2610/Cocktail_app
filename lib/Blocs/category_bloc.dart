import 'package:flutter/material.dart';
import 'package:cocktail_flutter/data/vos/category_vo.dart';
import 'package:cocktail_flutter/data/models/cocktail_model_impl.dart';
import 'package:cocktail_flutter/network/response/category_list_response.dart';

import '../data/models/cocktail_model.dart';

class CategoryBloc extends ChangeNotifier {
  final CocktailModel _model = CocktailModelImpl();
  bool isDisposed = false;

  List<CategoryVO>? categoryList;

  CategoryBloc() {
    _model.getCategoryListFromNetwork().then((list) {
      categoryList = list ?? [];
      safeChangeNotifier();
    });
  }

  void safeChangeNotifier() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}
