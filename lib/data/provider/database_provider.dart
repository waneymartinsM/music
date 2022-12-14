import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_flutter/data/model/song_model.dart';

class DatabaseProvider {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  Stream<List<SongModel>> songsStream() {
    return _database.collection('songs').snapshots().map((QuerySnapshot query) {
      List<SongModel> songsList = [];
      for (var song in query.docs) {
        final songModel =
            SongModel.fromDocumentSnapshot(documentSnapshot: song);
        songsList.add(songModel);
      }
      return songsList;
    });
  }

  Future<List<SongModel>> getAlbumSongs(String album) async {
    return await _database
        .collection('songs')
        .where('album', isEqualTo: album)
        .get()
        .then((QuerySnapshot query) {
      List<SongModel> songsList = [];
      for (var song in query.docs) {
        final songModel =
            SongModel.fromDocumentSnapshot(documentSnapshot: song);
        songsList.add(songModel);
      }
      return songsList;
    });
  }
}
