import 'package:bingo/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaNote extends StatefulWidget {
  @override
  _LaNoteState createState() => _LaNoteState();
}

class _LaNoteState extends State<LaNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'La Note',
          style: GoogleFonts.roboto(
            fontSize: 18,
            color: black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30, left: 23),
              child: Text(
                'Adresse de livraison',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 16, right: 16),
              child: Container(
                color: white,
                height: 108,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: 27.5, right: 27.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Abrous Nassim',
                            style: GoogleFonts.acme(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                          FlatButton(
                            child: Text(
                              'Changer',
                              style: GoogleFonts.acme(
                                  fontSize: 14, color: primary),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 0, left: 27.5, right: 110.5),
                      child: Container(
                        height: 52,
                        width: 205,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Coperative amitie batiment B numero 25 ',
                                style: GoogleFonts.acme(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Wilaya d\'Alger Bir Mourad Rais',
                                style: GoogleFonts.acme(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 23),
              child: Text(
                'Methode de paiment',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
