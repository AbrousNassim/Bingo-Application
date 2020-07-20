import 'package:bingo/constant/Color.dart';
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
    Profile(),
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
            title: Text('Categories'),
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
