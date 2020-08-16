import 'package:bingo/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Parametre extends StatefulWidget {
  @override
  _ParametreState createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
  String name;
  String motsdepasse = '1234567';
  bool _stateVent = false;
  bool _stateMAJ = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Paramètres',
              style: GoogleFonts.adamina(
                fontSize: 34,
              ))),
      body: Container(
        color: background,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 22, left: 16),
                child: Text('Informations personelles',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                    ))),
            Container(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                color: Colors.white,
                height: 64,
                child: Center(
                  child: TextFormField(
                    initialValue: name == null ? '' : name,
                    decoration: new InputDecoration.collapsed(
                        hintText: (" Nom complet "),
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
            ),
            Padding(
                padding: EdgeInsets.only(top: 21, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Mot de passe',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                        )),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      child: Text('Changer',
                          style: GoogleFonts.roboto(fontSize: 16, color: grey)),
                      onPressed: () => showPopUp(),
                    ),
                  ],
                )),
            Container(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                color: Colors.white,
                height: 64,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                      motsdepasse == null ? '' : "*" * motsdepasse.length,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(fontSize: 20, color: black)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 55, left: 16, right: 16),
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Notifications',
                        style: GoogleFonts.roboto(fontSize: 16, color: black)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Ventes',
                            style:
                                GoogleFonts.roboto(fontSize: 16, color: black)),
                        Switch(
                            value: _stateVent,
                            activeColor: primary,
                            onChanged: (bool s) {
                              setState(() {
                                _stateVent = s;
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Mises a jour du statut de la livraison',
                            style:
                                GoogleFonts.roboto(fontSize: 16, color: black)),
                        Switch(
                            value: _stateMAJ,
                            activeColor: primary,
                            onChanged: (bool s) {
                              setState(() {
                                _stateMAJ = s;
                              });
                            })
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 120,
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
                      'Enregistre',
                      style: TextStyle(color: white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showPopUp() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(34.0),
        ),
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: ChangeMotDePasse(),
          );
        });
  }
}

class ChangeMotDePasse extends StatefulWidget {
  @override
  _ChangeMotDePasseState createState() => _ChangeMotDePasseState();
}

class _ChangeMotDePasseState extends State<ChangeMotDePasse> {
  String motsDePasse;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Center(
            child: Text(
              'Changer le mot de passe',
              style: TextStyle(color: black, fontSize: 18),
            ),
          ),
        ),
        Container(height: 17),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            color: Colors.white,
            height: 64,
            width: 500,
            child: Center(
              child: TextFormField(
                initialValue: motsDePasse == null ? '' : motsDePasse,
                obscureText: true,
                decoration: new InputDecoration.collapsed(
                    hintText: ("   Mot de passe actuel"),
                    hintStyle: GoogleFonts.acme(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: grey)),
                onChanged: (val) {
                  setState(() {
                    motsDePasse = val;
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 0),
          alignment: Alignment.centerRight,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            child: Text(
              'Mot de passe oublie ?',
              style: TextStyle(color: grey, fontSize: 12),
            ),
            onPressed: () {},
          ),
        ),
        Container(height: 17),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            color: Colors.white,
            height: 64,
            child: Center(
              child: TextFormField(
                initialValue: motsDePasse == null ? '' : motsDePasse,
                obscureText: true,
                decoration: new InputDecoration.collapsed(
                    hintText: ("   Nouveau mot de passe"),
                    hintStyle: GoogleFonts.acme(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: grey)),
                onChanged: (val) {
                  setState(() {
                    motsDePasse = val;
                  });
                },
              ),
            ),
          ),
        ),
        Container(height: 100),
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
                  'Enregistre',
                  style: TextStyle(color: white, fontSize: 14),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
