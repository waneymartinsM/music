import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:music_flutter/controller/player_controller.dart';
import 'package:music_flutter/routes/app_routes.dart';
import '../../data/model/song_model.dart';
import '../../data/provider/api_provider.dart';

class AlbumsSeeMoreList extends StatelessWidget {
  AlbumsSeeMoreList({
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
        onTap: () => Get.toNamed(
          AppRoutes.album,
          arguments: <String, dynamic>{"album": data[index]},
        ),
        leading: _LeadingWidget(
          album: data[index].album,
          albumPicUrl: cloudinaryApi.getAlbumPicURL(data[index].album),
        ),
        title: Obx(
          () => _TitleWidget(
            album: data[index].album,
            active: playerController.getCurrentSong?.album == data[index].album,
          ),
        ),
        subtitle: Obx(
          () => _SubtitleWidget(
            artist: data[index].artists[0],
            active: playerController.getCurrentSong?.album == data[index].album,
          ),
        ),
        trailing: Obx(
          () => _TrailingWidget(
            data: data,
            index: index,
            title: title,
            active: playerController.getCurrentSong?.album == data[index].album,
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
          fit: BoxFit.cover,
          useOldImageOnUrlChange: true,
          cacheKey: album,
          imageUrl: albumPicUrl,
        ),
      ),
    );
  }
}

//******************************************************************************

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key, required this.album, this.active})
      : super(key: key);

  final String album;
  final bool? active;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Text(
      album,
      overflow: TextOverflow.ellipsis,
      style: active == true
          ? TextStyle(color: theme.colorScheme.primary)
          : TextStyle(color: theme.textTheme.bodySmall?.color),
    );
  }
}

//******************************************************************************

class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget({Key? key, required this.artist, this.active})
      : super(key: key);
  final String artist;
  final bool? active;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          artist,
          overflow: TextOverflow.ellipsis,
          style: active == true
              ? TextStyle(color: theme.colorScheme.primary)
              : TextStyle(color: theme.textTheme.bodySmall?.color),
        ),
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
  }) : super(key: key);

  final playerController = Get.find<PlayerController>();
  final List<SongModel> data;
  final int index;
  final String title;
  final bool? active;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Icon(
      FeatherIcons.chevronRight,
      color: active == true ? theme.colorScheme.primary : theme.iconTheme.color,
    );
  }
}

