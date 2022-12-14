import 'package:get/get.dart';
import 'package:music_flutter/controller/album_controller.dart';
import 'package:music_flutter/data/provider/database_provider.dart';
import 'package:music_flutter/data/repository/album_repository.dart';

class AlbumBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlbumController(
            repository: AlbumRepository(
          provider: DatabaseProvider(),
        )));
  }
}
