import '../model/song_model.dart';
import '../model/user_model.dart';
import '../provider/database_provider.dart';
import '../provider/user_provider.dart';

class HomeRepository {
  HomeRepository({
    required this.databaseProvider,
    required this.userProvider,
  });

  final DatabaseProvider databaseProvider;
  final UserProvider userProvider;

  Stream<List<SongModel>> songsStream(){
    return databaseProvider.songsStream();
  }

  UserModel? getCurrentUser(){
    return userProvider.getCurrentUser();
  }
}
