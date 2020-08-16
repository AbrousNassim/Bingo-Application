import 'package:bingo/constant/Color.dart';
import 'package:bingo/model/User.dart';
import 'package:bingo/views/parametre.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  User user = User();
  Profile({this.user});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: background,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 18, left: 15),
              child: Text('Mon Profil',
                  style: GoogleFonts.adamina(fontSize: 24, color: black)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: widget.user.photoUrl,
                      height: 64,
                      width: 64,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      children: <Widget>[
                        Text(widget.user.name,
                            style:
                                GoogleFonts.acme(fontSize: 18, color: black)),
                        Text(widget.user.email,
                            style: GoogleFonts.acme(fontSize: 14, color: grey))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 72,
              padding: EdgeInsets.only(top: 50, left: 15),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Mes commandes',
                        style: GoogleFonts.roboto(fontSize: 18, color: black)),
                    IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
            ),
            Container(
              height: 72,
              padding: EdgeInsets.only(top: 50, left: 15),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Mes produits en ventes',
                        style: GoogleFonts.roboto(fontSize: 18, color: black)),
                    IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
            ),
            Container(
              height: 72,
              padding: EdgeInsets.only(top: 50, left: 15),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Adresses de livraison',
                        style: GoogleFonts.roboto(fontSize: 18, color: black)),
                    IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
            ),
            Container(
              height: 72,
              padding: EdgeInsets.only(top: 50, left: 15),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Méthodes de payments',
                        style: GoogleFonts.roboto(fontSize: 18, color: black)),
                    IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
            ),
            Container(
              height: 72,
              padding: EdgeInsets.only(top: 50, left: 15),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Paramètres',
                        style: GoogleFonts.roboto(fontSize: 18, color: black)),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => Parametre()));
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
