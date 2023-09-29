import 'package:cocktail_flutter/data/vos/category_vo.dart';
import 'package:flutter/material.dart';
import 'package:json_serializable/json_serializable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_list_response.g.dart';

@JsonSerializable()
class CategoryListResponse {
  @JsonKey(name: "drinks")
  List<CategoryVO>? category_list;
  CategoryListResponse({this.category_list});

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListResponseToJson(this);
}
