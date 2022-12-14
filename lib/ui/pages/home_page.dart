import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_flutter/controller/home_controller.dart';
import 'package:music_flutter/routes/app_routes.dart';
import 'package:music_flutter/widgets/appbar_widget.dart';
import 'package:music_flutter/widgets/lists/album_list.dart';
import 'package:music_flutter/widgets/lists/artist_list.dart';
import 'package:music_flutter/widgets/lists/song_list.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Bem-vindo!',
        subTitle: controller.getUser?.name ?? '',
        actions: [
          SizedBox(
            height: 50,
            width: 50,
            child: InkWell(
              onTap: () => Get.toNamed(AppRoutes.profile),
              child: Ink(
                child: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: controller.getUser?.photoUrl != null
                        ? CachedNetworkImage(
                            imageUrl: controller.getUser!.photoUrl!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            useOldImageOnUrlChange: true,
                            cacheKey: 'profile_pic',
                          )
                        : const CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 100,
        ),
        child: Column(
          children: [
            Obx(
              () => ArtistList(
                title: 'Alguns artistas',
                artists: controller.songs,
                length: 5,
              ),
            ),
            const SizedBox(height: 16 * 2),
            Obx(
              () => SongList(
                title: 'Recomendados',
                songs: controller.songs,
                length: 5,
              ),
            ),
            const SizedBox(height: 16 * 2),
            Obx(
              () => AlbumList(
                title: 'Alguns álbuns',
                albums: controller.songs,
                length: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
