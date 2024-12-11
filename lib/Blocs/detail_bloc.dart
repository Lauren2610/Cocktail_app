import 'package:flutter/material.dart';
import 'package:cocktail_flutter/data/models/cocktail_model_impl.dart';
import 'package:cocktail_flutter/data/models/cocktail_model.dart';
import 'package:cocktail_flutter/data/vos/cocktail_vo.dart';
import 'package:cocktail_flutter/Pages/result_page.dart';

class DetailBloc extends ChangeNotifier {
  final CocktailModel _model = CocktailModelImpl();
  bool isDisposed = false;
  CocktailVO? resultCocktail;

  DetailBloc(CocktailVO cocktailVO) {
    if (cocktailVO.strInstructions == null) {
      _model.getCocktailById(cocktailVO.idDrink ?? '0').then((cocktail) {
        resultCocktail = cocktail;
        print(resultCocktail.toString());
        safeNotifyListeners();
      });
    } else {
      resultCocktail = cocktailVO;
      safeNotifyListeners();
    }
  }

  void safeNotifyListeners() {
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
