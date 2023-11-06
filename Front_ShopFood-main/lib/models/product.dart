import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

@JsonSerializable()
class Product with ChangeNotifier{
  final num id;
  final String name;
  final int price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image
  });
}
