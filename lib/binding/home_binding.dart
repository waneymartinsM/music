import 'package:get/get.dart';
import 'package:music_flutter/data/provider/database_provider.dart';
import 'package:music_flutter/data/provider/user_provider.dart';
import 'package:music_flutter/controller/home_controller.dart';
import 'package:music_flutter/data/repository/home_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
            repository: HomeRepository(
          databaseProvider: DatabaseProvider(),
          userProvider: UserProvider(),
        )));
  }
}
