import 'package:get/get.dart';
import 'package:music_flutter/data/model/song_model.dart';
import 'package:music_flutter/data/model/user_model.dart';
import 'package:music_flutter/data/repository/home_repository.dart';

class HomeController extends GetxController {
  HomeController({
    required this.repository,
  });

  final HomeRepository repository;

  final Rx<UserModel?> _user = Rx(null);
  Rx<List<SongModel>> songsList = Rx<List<SongModel>>([]);

  UserModel? get getUser => _user.value;
  List<SongModel> get songs => songsList.value;

  @override
  void onInit() {
    _user.value = repository.getCurrentUser();
    songsList.bindStream(repository.songsStream());
    super.onInit();
  }
}
