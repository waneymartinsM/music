import 'package:get/get.dart';
import 'package:music_flutter/data/model/user_model.dart';
import 'package:music_flutter/data/repository/profile_repository.dart';

class ProfileController extends GetxController {
  final ProfileRepository repository;

  final Rx<UserModel?> _user = Rx(null);

  UserModel? get getUser => _user.value;

  ProfileController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    _user.value = repository.getCurrentUser();
  }
}
