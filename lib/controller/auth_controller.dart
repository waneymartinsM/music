import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:music_flutter/controller/player_controller.dart';
import 'package:music_flutter/data/repository/auth_repository.dart';
import 'package:music_flutter/routes/app_routes.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  final PlayerController _playerController = Get.find<PlayerController>();
  final FirebaseAuth _authInstance = FirebaseAuth.instance;

  late Rx<User?> _user;

  AuthController(this.repository);

  @override
  void onReady() {
    super.onReady();

    _user = Rx<User?>(_authInstance.currentUser);
    _user.bindStream(_authInstance.authStateChanges());
    ever(_user, _checkLogin);
  }

  void _checkLogin(user) {
    if (user == null) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      Get.offAllNamed(AppRoutes.initial);
    }
  }

  Future<void> logOut() async {
    _playerController.stop();
    await repository.logOut();
  }
}
