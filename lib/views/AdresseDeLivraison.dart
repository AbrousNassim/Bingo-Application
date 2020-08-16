import 'package:bingo/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdresseDeLivraison extends StatelessWidget {
  String adresse;
  String ville;
  String willaya;
  int codePostale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ajouter une adresse de livraison',
          style: GoogleFonts.roboto(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                color: Colors.white,
                height: 64,
                width: 500,
                child: Center(
                  child: TextFormField(
                    initialValue: adresse == null ? '' : adresse,
                    obscureText: true,
                    decoration: new InputDecoration.collapsed(
                        hintText: ("   Mot de passe actuel"),
                        hintStyle: GoogleFonts.acme(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: grey)),
                    onChanged: (val) {
                      adresse = val;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
