import 'package:bingo/data/auth.dart';
import 'package:bingo/model/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';
import 'Wrapper.dart';
import 'constant/Color.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return StreamProvider<User>.value(
        value: Auth().user,
        child: MaterialApp(
          title: 'shop',
          theme: ThemeData(
            scaffoldBackgroundColor: background,
            dialogBackgroundColor: background,
            primaryColor: background,
            primarySwatch: Colors.red,
            primaryTextTheme: TextTheme(),
            cardColor: primary,
          ),
          home: Scaffold(
            body: Wrapper(),
          ),
        ));
  }
}
