import 'package:get/get.dart';
import 'package:music_flutter/data/provider/auth_provider.dart';
import 'package:music_flutter/data/repository/auth_repository.dart';
import 'package:music_flutter/controller/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(
            repository: AuthRepository(
          provider: AuthProvider(),
        )));
  }
}
