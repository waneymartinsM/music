import 'package:cloud_firestore/cloud_firestore.dart';

class SongModel{
  late String title;
  late String album;
  late List artists;
  late int duration;

  SongModel({
   required this.title,
   required this.album,
   required this.artists,
   required this.duration,
});

  SongModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    title = documentSnapshot['title'];
    album = documentSnapshot['album'];
    artists = documentSnapshot['artists'];
    duration = documentSnapshot['duration'];
  }
}