import 'package:music_flutter/data/provider/auth_provider.dart';

class AuthRepository {
  AuthRepository({required this.provider});

  final AuthProvider provider;

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    await provider.loginWithEmailAndPass(email, password);
  }

  Future<void> registerWithEmailAndPassword(String email, String password,
      String username, String b64ProfilePic) async {
    await provider.registerWithEmailAndPassword(
        username, email, password, b64ProfilePic);
  }

  Future<void> loginWithApple() async {}

  Future<void> logOut() async {
    await provider.logOut();
  }
}