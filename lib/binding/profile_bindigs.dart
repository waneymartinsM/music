import 'package:get/get.dart';
import 'package:music_flutter/controller/profile_controller.dart';
import 'package:music_flutter/data/provider/user_provider.dart';
import 'package:music_flutter/data/repository/profile_repository.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
          () => ProfileController(
        repository: ProfileRepository(
          userProvider: UserProvider(),
        ),
      ),
    );
  }
}
