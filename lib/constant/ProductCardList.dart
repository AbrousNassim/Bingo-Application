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
        productEtat: 'Neuf',
        producteName: 'acer-5468',
        isLiked: false,
        producteDescription:
            "Google LLC /ˈguːgəl/ est une entreprise américaine de services technologiques fondée en 1998 dans la Silicon Valley, en Californie, par Larry Page et Sergey Brin, créateurs du moteur de recherche Google. C'est une filiale de la société Alphabet depuis août 2015.",
        producteUrlPic1: 'http://via.placeholder.com/413x275',
        producteUrlPic2: 'http://via.placeholder.com/413x275',
        producteUrlPic3: 'http://via.placeholder.com/413x275',
        user: User(
            location: 'Alger,oran',
            name: 'Abrous Nassim',
            phoneNumber: '0557059399')),
    Product(
        categorie: '',
        productPrice: 1500,
        productEtat: 'Utilise',
        producteName: 'acer-5468',
        isLiked: false,
        producteUrlPic1: 'http://via.placeholder.com/350x150',
        user: User(location: 'Alger,oran')),
    Product(
        categorie: '',
        productPrice: 2500,
        producteUrlPic1: 'http://via.placeholder.com/350x150',
        productEtat: 'neuf',
        producteName: 'nvida 4080 ti',
        isLiked: false,
        user: User(location: 'ourgla,rhutn')),
    Product(
        categorie: '',
        productPrice: 15000,
        productEtat: 'neuf',
        producteUrlPic1: 'http://via.placeholder.com/350x150',
        producteName: 'acer-5468',
        isLiked: false,
        user: User(location: 'oran,oran')),
    Product(
        categorie: '',
        productPrice: 1100,
        productEtat: 'Utilise',
        producteUrlPic1: 'http://via.placeholder.com/350x150',
        producteName: 'dell xps',
        isLiked: false,
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
