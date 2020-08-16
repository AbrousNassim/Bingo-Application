import 'package:bingo/constant/Color.dart';
import 'package:bingo/model/User.dart';
import 'package:flutter/material.dart';
import 'Categorie.dart';
import 'Profile.dart';
import 'homePage.dart';

class Pages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PagesState();
  }
}

class PagesState extends State<Pages> {
  int _selectedTab = 0;
  final _pageOptions = [
    HomePage(),
    Profile(
      user: User(
          email: 'nas897700@Gmail.com',
          name: 'Nassim Abrous',
          photoUrl: 'http://via.placeholder.com/413x275'),
    ),
    Categorie(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primary,
        selectedFontSize: 15,
        currentIndex: _selectedTab,
        onTap: (int index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('favorite'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
        ],
      ),
    );
  }
}
