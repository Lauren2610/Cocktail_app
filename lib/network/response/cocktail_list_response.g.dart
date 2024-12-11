// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CocktailListResponse _$CocktailListResponseFromJson(
        Map<String, dynamic> json) =>
    CocktailListResponse(
      cocktail_list: (json['drinks'] as List<dynamic>?)
          ?.map((e) => CocktailVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CocktailListResponseToJson(
        CocktailListResponse instance) =>
    <String, dynamic>{
      'drinks': instance.cocktail_list,
    };
