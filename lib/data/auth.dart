import 'package:bingo/model/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookLogin _facebookLogin = FacebookLogin();
  User userFromFireBase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future<User> singUpEmail(String name, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      FirebaseUser user = result.user;
    } catch (signUpError) {
      if (signUpError is PlatformException) {
        if (signUpError.code == 'ERROR_EMAIL_ALREADY_IN_USE') {}
      }
    }
  }

  Future singInEmail(String email, String password) async {
    try {
      AuthResult resolt = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);

      FirebaseUser user = resolt.user;
      print(user);
      return user;
    } catch (e) {
      print("problemmm sing in");
      print(e.toString());
      return null;
    }
  }

  Future<void> googleSingIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential authCredential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    AuthResult result = (await _auth.signInWithCredential(authCredential));
    FirebaseUser user = result.user;
  }

  Future facebookSingIn() async {
    final result = await _facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;

        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');

        AuthCredential fbCredential =
            FacebookAuthProvider.getCredential(accessToken: token);
        AuthResult resulta = (await _auth.signInWithCredential(fbCredential));
        FirebaseUser user = resulta.user;
        print(user);
        print("-----------------------------------------------------");
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);

        break;

      case FacebookLoginStatus.cancelledByUser:
        break;

      case FacebookLoginStatus.error:
        print(FacebookLoginStatus.error);
        break;
    }
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => userFromFireBase(user));
  }

  Future signOut() async {
    try {
      return await _auth.signOut().then((value) async {
        if (await _googleSignIn.isSignedIn()) {
          _googleSignIn.signOut();
        }
        if (await _facebookLogin.isLoggedIn) {
          _facebookLogin.logOut();
        }
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
