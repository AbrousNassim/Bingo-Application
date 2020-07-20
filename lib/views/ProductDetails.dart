import 'package:bingo/model/Product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails({this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.producteName),
      ),
      body: Column(
        children: <Widget>[Text(widget.product.user.location)],
      ),
    );
  }
}
