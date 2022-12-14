import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? name;
  String? email;
  String? photoUrl;
  bool? isEmailVerified;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.photoUrl,
    this.isEmailVerified,
  });

  UserModel.fromFirebaseUser({required User user}) {
    uid = user.uid;
    name = user.displayName;
    email = user.email;
    isEmailVerified = user.emailVerified;
    photoUrl = user.photoURL;
  }
}
