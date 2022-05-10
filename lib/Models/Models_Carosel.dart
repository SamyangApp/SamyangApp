// TODO Implement this library.// TODO Implement this library.// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Carousel extends Equatable {
  final String ProductUrl;
  final String ProductNames;

  Carousel({
    required this.ProductUrl,
    required this.ProductNames,
  });


  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      ProductUrl,
      ProductNames
    ];
  }

  static  Carousel fromSnapshot(DocumentSnapshot snap) {
    Carousel carousel = Carousel(ProductUrl: snap['Product_Img'], ProductNames: snap['Product_Name']);
    return carousel;
  }


  static List<Carousel> Carousels = [
    Carousel(
      ProductUrl: 'https://firebasestorage.googleapis.com/v0/b/samyangapp-c93cb.appspot.com/o/15.png?alt=media&token=5190eb6a-a321-4ac6-acca-024181725a99', 
      ProductNames: 'Ramens'
      ),
    Carousel(
      ProductUrl: 'https://firebasestorage.googleapis.com/v0/b/samyangapp-c93cb.appspot.com/o/17.png?alt=media&token=5881ba5e-b467-4ab7-81fe-058835d0a0c5', 
      ProductNames: 'Sauces'
      ),
    Carousel(
      ProductUrl: 'https://firebasestorage.googleapis.com/v0/b/samyangapp-c93cb.appspot.com/o/21.png?alt=media&token=8124fe9c-fcea-40ec-ba20-ba4fef7af2a1', 
      ProductNames: 'Ramen Cups'
      ),

  ];
}
