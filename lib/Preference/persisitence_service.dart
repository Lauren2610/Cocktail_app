import 'dart:convert';

import 'package:cocktail_flutter/Perference/persisitence_key.dart';
import 'package:cocktail_flutter/data/vos/cocktail_vo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerferenceService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  //Encode to Json and save
  Future<bool> saveSingleCocktail(CocktailVO cocktail) async {
    final prefs = await _prefs;
    String cocktailString = jsonEncode(cocktail.toJson());
    List<String> cocktailList = prefs.getStringList(COCKTAIL_LIST_KEY) ?? [];
    cocktailList.add(cocktailString);
    return prefs.setStringList(COCKTAIL_LIST_KEY, cocktailList);
  }

//Decode to String and get
  Future<List<CocktailVO?>> getCocktaillist() async {
    final prefs = await _prefs;
    List<CocktailVO?> cocktailList = [];
    List<String> cocktailStringList =
        prefs.getStringList(COCKTAIL_LIST_KEY) ?? [];
    for (var cocktailString in cocktailStringList) {
      Map<String, dynamic> json =
          jsonDecode(cocktailString) as Map<String, dynamic>;
      CocktailVO cocktail = CocktailVO.fromJson(json);
      cocktailList.add(cocktail);
    }
    return Future.value(cocktailList);
  }
}
