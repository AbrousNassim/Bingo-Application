import 'package:bingo/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = "";
  String erreur = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            height: 60,
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
                onPressed: () {
                  setState(
                    () => Navigator.pop(context),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Mot de passe oublié',
                style: GoogleFonts.adamina(
                    fontSize: 34, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            height: 87,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
                'Veuillez saisir votre adresse e-mail. Vous recevrez un lien pour créer un nouveau mot de passe par e-mail.'),
          ),
          Container(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              color: Colors.white,
              height: 64,
              child: TextFormField(
                style:
                    GoogleFonts.acme(fontSize: 14, fontWeight: FontWeight.w500),
                decoration: new InputDecoration.collapsed(
                    hintText: (" Email "),
                    hintStyle: GoogleFonts.acme(
                        fontSize: 14, fontWeight: FontWeight.w500)),
                validator: (val) =>
                    val.isEmpty ? 'Adresse email invalide. ' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
            ),
          ),
          Container(height: 70),
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
                    'ENVOYER',
                    style: GoogleFonts.acme(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
