import 'package:music_flutter/data/model/user_model.dart';
import 'package:music_flutter/data/provider/user_provider.dart';

class ProfileRepository {
  final UserProvider userProvider;

  ProfileRepository({
    required this.userProvider,
  });

  UserModel? getCurrentUser() {
    return userProvider.getCurrentUser();
  }
}