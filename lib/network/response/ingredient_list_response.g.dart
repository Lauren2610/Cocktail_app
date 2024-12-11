// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientListResponse _$IngredientListResponseFromJson(
        Map<String, dynamic> json) =>
    IngredientListResponse(
      ingredientList: (json['drinks'] as List<dynamic>?)
          ?.map((e) => IngredientVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IngredientListResponseToJson(
        IngredientListResponse instance) =>
    <String, dynamic>{
      'drinks': instance.ingredientList,
    };
