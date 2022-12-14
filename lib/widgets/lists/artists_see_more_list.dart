import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:music_flutter/controller/player_controller.dart';
import 'package:music_flutter/data/model/song_model.dart';
import 'package:music_flutter/data/provider/api_provider.dart';

class ArtistsSeeMoreList extends StatelessWidget {
  ArtistsSeeMoreList({Key? key, required this.title, required this.data})
      : super(key: key);

  final cloudinaryApi = Get.put<ApiProvider>(ApiProvider());
  final playerController = Get.find<PlayerController>();
  final String title;
  final List<SongModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: data.length,
      itemBuilder: (context, index) => ListTile(
        contentPadding: const EdgeInsets.all(0),
        onTap: () => {},
        leading: _LeadingWidget(
          artist: data[index].artists[0],
          artistPicUrl: cloudinaryApi.getArtistPicURL(
            data[index].artists[0],
          ),
        ),
        title: _TitleWidget(
          artist: data[index].artists[0],
          active: false,
        ),
        trailing: _TrailingWidget(
          data: data,
          index: index,
          title: title,
          active: false,
        ),
      ),
    );
  }
}

//******************************************************************************

class _LeadingWidget extends StatelessWidget {
  const _LeadingWidget(
      {Key? key, required this.artist, required this.artistPicUrl})
      : super(key: key);

  final String artist;
  final String artistPicUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: CachedNetworkImage(
          imageUrl: artistPicUrl,
          fit: BoxFit.cover,
          useOldImageOnUrlChange: true,
          cacheKey: artist,
        ),
      ),
    );
  }
}

//******************************************************************************

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key, required this.artist, this.active})
      : super(key: key);

  final String artist;
  final bool? active;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Text(
      artist,
      overflow: TextOverflow.ellipsis,
      style: active == true
          ? TextStyle(color: theme.colorScheme.primary)
          : TextStyle(
              color: theme.textTheme.bodySmall?.color,
            ),
    );
  }
}

//******************************************************************************

class _TrailingWidget extends StatelessWidget {
  _TrailingWidget(
      {Key? key,
      required this.data,
      required this.index,
      required this.title,
      this.active})
      : super(key: key);

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
