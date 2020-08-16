import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid = '';
  String name = 'name';
  String photoUrl = '';
  String email = 'name';
  String phoneNumber;
  var location = '';

  User(
      {this.uid,
      this.name,
      this.photoUrl,
      this.email,
      this.phoneNumber,
      this.location});

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      email: doc['email'],
      uid: doc.documentID,
      name: doc['name'],
      photoUrl: doc['photoUrl'],
      phoneNumber: doc['phoneNumber'],
      location: doc['location'],
    );
  }
}
