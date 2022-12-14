import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_flutter/data/model/user_model.dart';
import 'package:music_flutter/data/provider/user_provider.dart';

class UserRepository {
  UserRepository({required this.provider});

  final UserProvider provider;

  UserModel? getCurrentUser() {
    return provider.getCurrentUser();
  }

  Future<void> updateUser(User userInstance, UserModel user) async {
    return await provider.updateUser(userInstance, user);
  }
}
