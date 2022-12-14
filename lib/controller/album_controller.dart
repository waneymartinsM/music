import 'package:get/get.dart';
import 'package:music_flutter/data/model/song_model.dart';
import 'package:music_flutter/data/repository/album_repository.dart';

class AlbumController extends GetxController{
  AlbumController({required this.repository});

  final AlbumRepository repository;

  Future<List<SongModel>> getAlbumSongs(String album) async {
    return await repository.getAlbumSongs(album);
  }
}