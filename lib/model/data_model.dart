import 'package:flutter/cupertino.dart';

class DataModel{
  String name;
  String img;
  int price;
  int poeple;
  int start;
  String description;
  String location;
  DataModel({Key,key, required this.name, required this.img, required this.price, required this.poeple, required this.start, required this.description, required this.location});

  factory DataModel.fromJson(Map<String, dynamic>)
}