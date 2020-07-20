import 'package:bingo/constant/Color.dart';
import 'package:bingo/constant/Loading.dart';
import 'package:bingo/data/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ForgotPassword.dart';

class SingIn extends StatefulWidget {
  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  // texte state
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
                        'S’identifier',
                        style: GoogleFonts.adamina(
                            fontSize: 34, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    height: 73,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      color: Colors.white,
                      height: 64,
                      child: TextFormField(
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
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      color: Colors.white,
                      height: 64,
                      child: TextFormField(
                        obscureText: true,
                        style: GoogleFonts.acme(
                            fontSize: 14, fontWeight: FontWeight.w500),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Vous avez oublié votre mot de passe ?',
                        style: TextStyle(color: black),
                      ),
                      IconButton(
                          icon: Icon(Icons.arrow_forward, color: primary),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        new ForgotPassword()));
                          })
                    ],
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
                                await _auth.singInEmail(email, password);
                            setState(() => Navigator.pop(context));

                            if (resolt == null) {
                              setState(() {
                                erreur = "email or password invalid";
                                loading = false;
                              });
                            }
                          }
                        },
                        child: Center(
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(color: white, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                  ),
                  Center(child: Text('or sing in with social acconte')),
                  Container(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 64,
                        width: 92,
                        decoration: BoxDecoration(
                            border: Border.all(color: grey, width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(24),
                            ),
                            color: white),
                        child: Center(
                          child: IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.red,
                            ),
                            onPressed: () async {
                              await _auth.googleSingIn();
                              setState(() => Navigator.pop(context));
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          height: 64,
                          width: 92,
                          decoration: BoxDecoration(
                              border: Border.all(color: grey, width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                              color: white),
                          child: Center(
                            child: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.facebookF,
                                color: Color.fromRGBO(59, 89, 152, 1),
                              ),
                              onPressed: () async {
                                await _auth.facebookSingIn();
                                setState(() => Navigator.pop(context));
                                if (_auth.facebookSingIn is PlatformException) {
                                  erreur = ' Email est deja utilise';
                                }
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
