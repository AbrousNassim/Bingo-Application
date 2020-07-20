// ignore: must_be_immutable
import 'package:bingo/constant/Color.dart';
import 'package:bingo/model/Product.dart';
import 'package:bingo/views/ProductDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  ProductCard({
    this.product,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            padding: EdgeInsets.all(0),
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new ProductDetails(
                              product: widget.product,
                            )));
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                height: 260,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: grey),
                    color: background),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 160,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: grey),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 143, left: 108),
                      child: ClipOval(
                        child: Container(
                            height: 36,
                            width: 36,
                            color: white,
                            child: Container(
                              child: Center(
                                child: IconButton(
                                  icon: Icon(Icons.favorite,
                                      color: isLike ? Colors.red : Colors.grey,
                                      size: 24),
                                  onPressed: () {
                                    setState(() {
                                      isLike = !isLike;
                                      if (isLike) {
                                        print('gg ');
                                      }
                                      if (!isLike) {
                                        print('pas gg');
                                      }
                                    });
                                  },
                                ),
                              ),
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 6, top: 167),
                      child: Text(
                        widget.product.user.location,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.oxygen(
                            fontSize: 9, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 191),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 100,
                            child: Text(
                              widget.product.producteName,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 238, right: 6, left: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.product.productEtat,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                          Text(
                            '${widget.product.productPrice} DA',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
