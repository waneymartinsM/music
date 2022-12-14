import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:music_flutter/data/model/user_model.dart';

class UserProvider{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  UserProvider(){
    _database.settings = const Settings(persistenceEnabled: true);
  }

  UserModel? getCurrentUser(){
    if(_auth.currentUser != null){
      return UserModel.fromFirebaseUser(user: _auth.currentUser!);
    }
    return null;
  }

  Future<void> updateUser(User user, UserModel model) async {
    final Map<String, dynamic> data = {};
    data.addIf(model.name != null, 'displayName', model.name);
    if(data.isNotEmpty) {
      await user.updateDisplayName(data['displayName']);
    }
  }
}