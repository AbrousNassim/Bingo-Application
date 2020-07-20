import 'package:bingo/constant/Color.dart';
import 'package:bingo/constant/Loading.dart';
import 'package:bingo/data/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingUp extends StatefulWidget {
  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  // texte state
  String name = "";
  String email = "";
  String password = "";
  String erreur = "";
  bool loading = false;
  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading
        ? SnipKit()
        : Scaffold(
            body: Form(
              key: _formKey,
              child: ListView(
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
                        'S’inscrire',
                        style: GoogleFonts.adamina(
                            fontSize: 34, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      color: Colors.white,
                      height: 64,
                      child: TextFormField(
                        style: GoogleFonts.acme(
                            fontSize: 14, fontWeight: FontWeight.w500),
                        decoration: new InputDecoration.collapsed(
                            hintText: (" Nom "),
                            hintStyle: GoogleFonts.acme(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      color: Colors.white,
                      height: 64,
                      child: TextFormField(
                        style: GoogleFonts.acme(
                            fontSize: 14, fontWeight: FontWeight.w500),
                        decoration: new InputDecoration.collapsed(
                            hintText: (" Email "),
                            hintStyle: GoogleFonts.acme(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        validator: (val) => val.isEmpty
                            ? 'Entrez une adresse e-mail valide'
                            : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      color: Colors.white,
                      height: 64,
                      child: TextFormField(
                        obscureText: true,
                        decoration: new InputDecoration.collapsed(
                            hintText: (" Mot de passe "),
                            hintStyle: GoogleFonts.acme(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        validator: (val) => val.length < 6
                            ? 'Le mot de passe doit contenir au moins 6 caractères'
                            : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 32,
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
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic resolt =
                                await _auth.singUpEmail(name, email, password);
                            setState(() => Navigator.pop(context));

                            if (resolt == null) {
                              setState(() {
                                erreur = "Email ou mot de passe invalide";
                                loading = false;
                              });
                            }
                          }
                        },
                        child: Center(
                          child: Text(
                            'S’INSCRIRE',
                            style: TextStyle(color: white, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      erreur,
                      style: GoogleFonts.oxygen(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: primary),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
