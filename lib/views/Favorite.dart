import 'package:bingo/constant/ProductCard.dart';
import 'package:bingo/model/Product.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Favorite extends StatefulWidget {
  List<Product> favorite = [];
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.6),
        scrollDirection: Axis.vertical,
        itemCount: widget.favorite.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            product: widget.favorite[index],
          );
        },
      ),
    );
  }
}
