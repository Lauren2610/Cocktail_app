import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/json_serializable.dart';

part 'category_vo.g.dart';

@JsonSerializable()
class CategoryVO {
  @JsonKey(name: 'strCategory')
  String? category;

  CategoryVO({this.category});
  factory CategoryVO.fromJson(Map<String, dynamic> json) =>
      _$CategoryVOFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryVOToJson(this);
}
