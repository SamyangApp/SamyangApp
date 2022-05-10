// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product {
  String Product_Name;
  String Product_Desc;
  String Product_Img;
  double Product_Price;
  int Stock;

  Product({
    required this.Product_Name,
    required this.Product_Desc,
    required this.Product_Img,
    required this.Product_Price,
    required this.Stock,
  });

  
  Map<String, dynamic> toJson() => {
      'Product_Name': Product_Name,
      'Product_Desc': Product_Desc,
      'Product_Img': Product_Img,
      'Product_Price': Product_Price,
      'Stock': Stock,
    };

  static Product fromJson(Map<String, dynamic> json ) => Product(
    Product_Name: json['Produt_Name'], 
    Product_Desc: json['Produt_Desc'], 
    Product_Img: json['Produt_Img'], 
    Product_Price: json['Produt_Price'], 
    Stock: json['Stock']
    );
}