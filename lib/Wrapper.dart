import 'package:bingo/views/auth/Authentification.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'constant/Loading.dart';
import 'model/User.dart';
import 'views/Pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    try {
      // return sois home sois login sing in ..
      if (user == null) {
        return Authentification();
      } else {
        return Pages();
      }
    } catch (e) {
      return SnipKit();
    }
  }
}
