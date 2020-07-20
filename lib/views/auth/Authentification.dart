import 'package:bingo/constant/Color.dart';
import 'package:bingo/views/auth/SingIn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'SingUp.dart';

class Authentification extends StatefulWidget {
  Authentification({Key key}) : super(key: key);

  @override
  _AuthentificationState createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromRGBO(255, 149, 89, 1),
            Color.fromRGBO(216, 4, 4, 1)
          ])),
      child: ListView(
        children: <Widget>[
          Container(
            height: 108,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.addressBook,
                size: 40,
                color: white,
              ),
              Text(
                ' Shope',
                style: TextStyle(
                    fontSize: 40,
                    color: white,
                    fontFamily: 'Raleway',
                    letterSpacing: 2),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 39, right: 39, top: 91),
            child: Container(
              child: Text(
                'cherche, trouve',
                style: TextStyle(
                    fontSize: 36,
                    color: white,
                    fontFamily: 'Raleway',
                    letterSpacing: 1),
              ),
            ),
          ),
          Container(
            height: 123,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                color: white,
              ),
              height: 48,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new SingIn()));
                },
                child: Center(
                  child: Text(
                    'S’IDENTIFIER',
                    style: TextStyle(color: primary, fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 18),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                color: white,
              ),
              height: 48,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new SingUp()));
                },
                child: Center(
                  child: Text(
                    'S’INSCRIRE',
                    style: TextStyle(color: primary, fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
