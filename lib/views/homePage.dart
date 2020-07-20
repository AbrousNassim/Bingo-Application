import 'package:bingo/constant/ProductCardList.dart';
import 'package:bingo/data/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          height: 133,
        ),
        Padding(
          padding: EdgeInsets.only(left: 7, right: 7, bottom: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'telephone',
                style: GoogleFonts.adamina(
                    fontSize: 34, fontWeight: FontWeight.w500),
              ),
              FlatButton(
                  onPressed: () {
                    setState(() {
                      _auth.signOut();
                    });
                  },
                  child: Text(
                    'view more',
                    style: GoogleFonts.adamina(
                        fontSize: 11, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ),
        Container(
          height: 261,
          child: ListProductCard(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 7, right: 7, bottom: 35, top: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Sport',
                style: GoogleFonts.adamina(
                    fontSize: 34, fontWeight: FontWeight.w500),
              ),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'view more',
                    style: GoogleFonts.adamina(
                        fontSize: 11, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ),
        Container(
          height: 261,
          child: ListProductCard(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 7, right: 7, bottom: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'informatique',
                style: GoogleFonts.adamina(
                    fontSize: 34, fontWeight: FontWeight.w500),
              ),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'view more',
                    style: GoogleFonts.adamina(
                        fontSize: 11, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ),
        Container(
          height: 261,
          child: ListProductCard(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 7, right: 7, bottom: 35, top: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Mode & beauté ',
                style: GoogleFonts.adamina(
                    fontSize: 34, fontWeight: FontWeight.w500),
              ),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'view more',
                    style: GoogleFonts.adamina(
                        fontSize: 11, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ),
        Container(
          height: 261,
          child: ListProductCard(),
        )
      ],
    ));
  }
}
