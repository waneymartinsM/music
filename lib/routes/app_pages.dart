import 'package:get/get.dart';
import 'package:music_flutter/binding/album_binding.dart';
import 'package:music_flutter/binding/home_binding.dart';
import 'package:music_flutter/binding/library_binding.dart';
import 'package:music_flutter/binding/login_binding.dart';
import 'package:music_flutter/binding/profile_bindigs.dart';
import 'package:music_flutter/binding/register_binding.dart';
import 'package:music_flutter/binding/root_binding.dart';
import 'package:music_flutter/binding/search_binding.dart';
import 'package:music_flutter/ui/pages/album_list_see_more_page.dart';
import 'package:music_flutter/ui/pages/album_page.dart';
import 'package:music_flutter/ui/pages/artist_list_see_more_page.dart';
import 'package:music_flutter/ui/pages/home_page.dart';
import 'package:music_flutter/ui/pages/library_page.dart';
import 'package:music_flutter/ui/pages/login_page.dart';
import 'package:music_flutter/ui/pages/profile_page.dart';
import 'package:music_flutter/ui/pages/register_page.dart';
import 'package:music_flutter/ui/pages/root_page.dart';
import 'package:music_flutter/ui/pages/search_page.dart';
import 'package:music_flutter/routes/app_routes.dart';
import 'package:music_flutter/ui/pages/song_list_see_more_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => RootPage(),
      maintainState: true,
      transition: Transition.circularReveal,
      bindings: [
        RootBinding(),
        HomeBinding(),
        LibraryBinding(),
        SearchBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: AppRoutes.library,
      page: () => const LibraryPage(),
      binding: LibraryBinding(),
    ),
    GetPage(
      name: AppRoutes.album,
      page: () => AlbumPage(),
      binding: AlbumBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.songListSeeMorePage,
      page: () => SongListSeeMorePage(),
    ),
    GetPage(
      name: AppRoutes.albumListSeeMorePage,
      page: () => AlbumListSeeMorePage(),
    ),
    GetPage(
      name: AppRoutes.artistListSeeMorePage,
      page: () => ArtistListSeeMorePage(),
    ),
  ];
}
