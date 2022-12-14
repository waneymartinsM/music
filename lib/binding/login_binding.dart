import 'package:get/get.dart';
import 'package:music_flutter/data/provider/auth_provider.dart';
import 'package:music_flutter/data/repository/auth_repository.dart';
import 'package:music_flutter/controller/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(
          repository: AuthRepository(provider: AuthProvider()),
        ));
  }
}
