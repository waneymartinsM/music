import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:music_flutter/controller/player_controller.dart';
import 'package:music_flutter/data/model/song_model.dart';
import 'package:music_flutter/data/provider/api_provider.dart';

class SongsSeeMoreList extends StatelessWidget {
  SongsSeeMoreList({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  final playerController = Get.find<PlayerController>();
  final cloudinaryApi = Get.put<ApiProvider>(ApiProvider());
  final String title;
  final List<SongModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => ListTile(
        contentPadding: const EdgeInsets.all(0),
        isThreeLine: true,
        onTap: () => playerController.play(data, index, title),
        leading: _LeadingWidget(
          album: data[index].album,
          albumPicUrl: cloudinaryApi.getAlbumPicURL(
            data[index].album,
          ),
        ),
        title: Obx(
          () => _TitleWidget(
            title: data[index].title,
            active: playerController.getCurrentSong?.title == data[index].title,
          ),
        ),
        subtitle: Obx(
          () => _SubtitleWidget(
            album: data[index].album,
            artists: data[index].artists.join(','),
            active: playerController.getCurrentSong?.title == data[index].title,
          ),
        ),
        trailing: Obx(
          () => _TrailingWidget(
            data: data,
            index: index,
            title: title,
            active: playerController.getCurrentSong?.title == data[index].title,
            isPlaying: playerController.getIsPlaying,
          ),
        ),
      ),
    );
  }
}

//******************************************************************************

class _LeadingWidget extends StatelessWidget {
  const _LeadingWidget(
      {Key? key, required this.album, required this.albumPicUrl})
      : super(key: key);

  final String album;
  final String albumPicUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: CachedNetworkImage(
          imageUrl: albumPicUrl,
          fit: BoxFit.cover,
          useOldImageOnUrlChange: true,
          cacheKey: album,
        ),
      ),
    );
  }
}

//******************************************************************************

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
    required this.title,
    this.active,
  }) : super(key: key);

  final String title;
  final bool? active;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: active == true
          ? TextStyle(color: theme.colorScheme.primary)
          : TextStyle(color: theme.textTheme.bodySmall?.color),
    );
  }
}

//******************************************************************************

class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget({
    Key? key,
    required this.album,
    required this.artists,
    this.active,
  }) : super(key: key);

  final String album;
  final String artists;
  final bool? active;

  Widget getTextWidget(BuildContext context, String text) {
    final ThemeData theme = Theme.of(context);
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: active == true
          ? TextStyle(color: theme.colorScheme.primary)
          : TextStyle(color: theme.textTheme.bodySmall?.color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getTextWidget(context, album),
        getTextWidget(context, artists),
      ],
    );
  }
}

//******************************************************************************

class _TrailingWidget extends StatelessWidget {
  _TrailingWidget({
    Key? key,
    required this.data,
    required this.index,
    required this.title,
    this.active,
    this.isPlaying,
  }) : super(key: key);

  final playerController = Get.find<PlayerController>();
  final List<SongModel> data;
  final int index;
  final String title;
  final bool? active;
  final bool? isPlaying;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return IconButton(
      onPressed: () => active == true
          ? playerController.playPause()
          : playerController.play(data, index, title),
      icon: active == true
          ? isPlaying == true
              ? const Icon(FeatherIcons.pause)
              : const Icon(FeatherIcons.play)
          : const Icon(FeatherIcons.play),
      color: active == true ? theme.colorScheme.primary : theme.iconTheme.color,
    );
  }
}

