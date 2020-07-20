import 'package:bingo/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Categories/electronique.dart';
import 'Categories/informatique.dart';
import 'Categories/maison.dart';
import 'Categories/mode.dart';
import 'Categories/telephone.dart';

class Categorie extends StatefulWidget {
  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Categorie',
          style: TextStyle(
              fontFamily: 'aby', fontSize: 20, fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
              color: black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            height: 50,
          ),
          blocCategorie('Téléphones', Telephone(), 'assets/images/tel.png', 23,
              39, 28, 39),
          Container(
            height: 21,
          ),
          blocCategorie('Informatique', Informatique(), 'assets/images/pc.png',
              23, 39, 28, 39),
          Container(
            height: 21,
          ),
          blocContainerElectronique(context),
          Container(
            height: 21,
          ),
          blocCategorie('Mode & beauté ', Mode(), 'assets/images/mode.png', 20,
              39, 0, 39),
          Container(
            height: 21,
          ),
          blocCategorie('Maison & fourniture ', Maison(),
              'assets/images/maison.png', 25, 25, 2, 0),
          // Container(
          //   height: 21,
          // ),
          // blocCategorie('tel', 'telephone', 'assets/images/electro.png'),
          // Container(
          //   height: 21,
          // ),
          // blocCategorie('tel', 'telephone', 'assets/images/electro.png'),
          // Container(
          //   height: 21,
          // ),
          // blocCategorie('tel', 'telephone', 'assets/images/electro.png'),
          // Container(
          //   height: 21,
          // ),
          // blocCategorie('tel', 'telephone', 'assets/images/electro.png'),
          // Container(
          //   height: 21,
          // ),
          // blocCategorie('tel', 'telephone', 'assets/images/electro.png'),
        ],
      ),
    );
  }

  Container blocContainerElectronique(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, -2), // changes position of shadow
          ),
        ],
      ),
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          setState(() {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => Electronique()));
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 100,
              width: 162,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                color: white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  top: 29,
                  right: 15,
                ),
                child: Text(
                  'électronique & électroménagers',
                  style: TextStyle(
                      fontFamily: 'aby',
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Container(
              height: 100,
              width: 161,
              child: Image.asset(
                'assets/images/electro.png',
                height: 100,
                fit: BoxFit.fill,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
              ),
            )
          ],
        ),
      ),
    );
  }

  blocCategorie(String name, Widget nameOfClasse, String image, double l,
      double t, double r, double b) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, -2), // changes position of shadow
          ),
        ],
      ),
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          setState(() {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => nameOfClasse));
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 100,
              width: 162,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                color: white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: l, //23
                  top: t, //39,
                  right: r, //58,
                  bottom: b, //39,
                ),
                child: Text(
                  '$name',
                  style: TextStyle(
                      fontFamily: 'aby',
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Container(
              height: 100,
              width: 161,
              child: Image.asset(
                '$image',
                height: 100,
                fit: BoxFit.fill,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
