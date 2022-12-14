import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_flutter/data/model/song_model.dart';
import 'package:music_flutter/widgets/lists/albums_see_more_list.dart';

class AlbumListSeeMorePage extends StatelessWidget {
  AlbumListSeeMorePage({Key? key}) : super(key: key);

  final String? _title = Get.arguments['title'];
  final List<SongModel>? _data = Get.arguments['data'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AlbumsSeeMoreList(
          title: _title ?? '',
          data: _data ?? [],
        ),
      ),
    );
  }
}
