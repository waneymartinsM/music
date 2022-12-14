import 'package:music_flutter/data/model/song_model.dart';
import 'package:music_flutter/data/provider/database_provider.dart';

class AlbumRepository {
  AlbumRepository({required this.provider});

  final DatabaseProvider provider;

  Future<List<SongModel>> getAlbumSongs(String album) async {
    return await provider.getAlbumSongs(album);
  }
}
