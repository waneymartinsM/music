import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:music_flutter/data/provider/api_provider.dart';
import 'package:music_flutter/routes/app_routes.dart';
import '../../data/model/song_model.dart';

class ArtistList extends StatelessWidget {
  ArtistList({
    Key? key,
    required this.title,
    required this.artists,
    this.length,
  }) : super(key: key) {
    data.addAll(artists);
    data.shuffle();
  }

  final cloudinaryApi = Get.put(ApiProvider());
  final String title;
  final List<SongModel> artists;
  final List<SongModel> data = [];
  final int? length;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            IconButton(
              onPressed: () => Get.toNamed(AppRoutes.artistListSeeMorePage,
                  arguments: <String, dynamic>{
                    'title': title,
                    'data': data,
                  }),
              icon: const Icon(FeatherIcons.chevronRight),
              alignment: Alignment.centerRight,
            ),
          ],
        ),
        SizedBox(
          height: 186,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: data.isNotEmpty && length != null ? length : data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(16),
                child: Ink(
                  width: 140 + 16,
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _LeadingWidget(
                        artist: data[index].artists[0],
                        artistPicUrl: cloudinaryApi.getArtistPicURL(
                          data[index].artists[0],
                        ),
                      ),
                      const SizedBox(height: 6),
                      _TitleWidget(
                        artist: data[index].artists[0],
                        active: false,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
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
          height: 50,
          fit: BoxFit.cover,
          useOldImageOnUrlChange: true,
          cacheKey: artist,
          imageUrl: artistPicUrl,
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
    return Text(artist,
        overflow: TextOverflow.ellipsis,
        style: active == true
            ? theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
              )
            : theme.textTheme.titleMedium?.copyWith(
                color: theme.textTheme.bodySmall?.color,
              ));
  }
}

