import 'package:bingo/constant/ProductCard.dart';
import 'package:bingo/model/Product.dart';
import 'package:bingo/model/User.dart';
import 'package:flutter/material.dart';

class ListProductCard extends StatefulWidget {
  @override
  _ListProductCardState createState() => _ListProductCardState();
}

class _ListProductCardState extends State<ListProductCard> {
  List<Product> prodactlist = [
    Product(
        categorie: '',
        productPrice: 1500,
        productEtat: 'Utilise',
        producteName: 'acer-5468',
        user: User(location: 'Alger,oran')),
    Product(
        categorie: '',
        productPrice: 1500,
        productEtat: 'Utilise',
        producteName: 'acer-5468',
        user: User(location: 'Alger,oran')),
    Product(
        categorie: '',
        productPrice: 2500,
        productEtat: 'neuf',
        producteName: 'nvida 4080 ti',
        user: User(location: 'ourgla,rhutn')),
    Product(
        categorie: '',
        productPrice: 15000,
        productEtat: 'neuf',
        producteName: 'acer-5468',
        user: User(location: 'oran,oran')),
    Product(
        categorie: '',
        productPrice: 1100,
        productEtat: 'Utilise',
        producteName: 'dell xps',
        user: User(location: 'Alger,oran')),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: prodactlist.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(product: prodactlist[index]);
      },
    );
  }
}
