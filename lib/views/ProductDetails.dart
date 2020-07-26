import 'package:bingo/constant/Color.dart';
import 'package:bingo/model/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails({this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.producteName,
          style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        Container(
          height: 413,
          child: listViewImagesProdact(),
        ),
        Container(
          padding: EdgeInsets.only(top: 17, left: 10, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('${widget.product.producteName}',
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  )),
              Text('${widget.product.productPrice} DA',
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('${widget.product.user.location}',
                        style: GoogleFonts.actor(
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                          color: grey,
                        )),
                    Text('${widget.product.user.name}',
                        style: GoogleFonts.actor(
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                          color: grey,
                        )),
                    Text('${widget.product.user.selNumber}',
                        style: GoogleFonts.roboto(
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                          color: grey,
                        )),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('${widget.product.productEtat}',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: favoritRound()),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 19),
          child: Text(
            widget.product.producteDescription,
            style: GoogleFonts.roboto(
              fontSize: 17,
              color: black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              color: primary,
            ),
            height: 48,
            child: FlatButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  'ACHETER',
                  style: TextStyle(color: white, fontSize: 14),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 19, bottom: 5),
          child: Container(
            height: 0.2,
            width: double.infinity,
            color: black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Info Livraison',
                style: GoogleFonts.roboto(fontSize: 17),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 17,
                  ),
                  onPressed: () {})
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12, bottom: 5),
          child: Container(
            height: 0.2,
            width: double.infinity,
            color: black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Support',
                style: GoogleFonts.roboto(fontSize: 17),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 17,
                  ),
                  onPressed: () {})
            ],
          ),
        ),
        Container(
          height: 15,
        )
      ]),
    );
  }

  favoritRound() {
    return ClipOval(
      child: Container(
          height: 36,
          width: 36,
          color: white,
          child: Center(
            child: IconButton(
              padding: EdgeInsets.only(right: 0),
              icon: Icon(Icons.favorite_border,
                  color: isLike ? Colors.red : Colors.grey, size: 30),
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
          )),
    );
  }

  listViewImagesProdact() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        imageCard(widget.product.producteUrlPic1),
        imageCard(widget.product.producteUrlPic2),
        imageCard(widget.product.producteUrlPic3),
      ],
    );
  }

  imageCard(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        height: 413,
        width: 275,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: 413,
          width: 275,
          fit: BoxFit.cover,
          placeholder: (context, url) {
            return Center(
              child: SpinKitPulse(
                color: primary,
                size: 50,
              ),
            );
          },
          errorWidget: (context, url, error) =>
              Icon(Icons.error, color: primary, size: 25),
        ),
      ),
    );
  }
}
