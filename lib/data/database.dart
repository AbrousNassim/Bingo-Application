import 'package:cloud_firestore/cloud_firestore.dart';

class DatabasseService {
  // collection referance users
  final CollectionReference users = Firestore.instance.collection("users");

  Future updateUserData(String uid, String name, String photoUrl, String email,
      String phoneNumber, var location) async {
    return await users.document(uid).setData({
      'uid': uid,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'location': location,
    });
  }
}
