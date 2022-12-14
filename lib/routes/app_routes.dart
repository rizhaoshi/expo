import 'package:get/get.dart';

import '../app/modules/home/article/article_binding.dart';
import '../app/modules/home/article/article_page.dart';
import '../app/modules/home/home_binding.dart';
import '../app/modules/home/home_page.dart';
import '../app/modules/home/home_video/home_video_binding.dart';
import '../app/modules/home/home_video/home_video_info_page.dart';
import '../app/modules/home/home_video/home_video_page.dart';
import '../app/modules/home/recommend/recommend_binding.dart';
import '../app/modules/home/recommend/recommend_page.dart';
import '../app/modules/home/singer/singer_binding.dart';
import '../app/modules/home/singer/singer_page.dart';
import '../app/modules/home/song/song_binding.dart';
import '../app/modules/home/song/song_page.dart';
import '../app/modules/home/tiny_video/tiny_video_binding.dart';
import '../app/modules/home/tiny_video/tiny_video_page.dart';
import '../app/modules/main/main_binding.dart';
import '../app/modules/main/main_page.dart';
import '../app/modules/mine/mine_binding.dart';
import '../app/modules/mine/mine_page.dart';
import '../app/modules/music/music_binding.dart';
import '../app/modules/music/music_page.dart';
import '../app/modules/splash/splash_binding.dart';
import '../app/modules/splash/splash_page.dart';
import '../app/modules/video/video_binding.dart';
import '../app/modules/video/video_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.SPLASH, page: () => SplashPage(), binding: SplashBinding()),
    GetPage(name: Routes.MAIN, page: () => MainPage(), binding: MainBinding()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.MUSIC, page: () => MusicPage(), binding: MusicBinding()),
    GetPage(name: Routes.VIDEO, page: () => VideoPage()),
    GetPage(name: Routes.MINE, page: () => MinePage(), binding: MineBinding()),
    GetPage(name: Routes.SONG, page: () => SongPage(), binding: SongBinding()),
    GetPage(name: Routes.SINGER, page: () => SingerPage(), binding: SingerBinding()),
    GetPage(name: Routes.TINY_VIDEO, page: () => TinyVideoPage(), binding: TinyVideoBinding()),
    GetPage(name: Routes.ARTICLE, page: () => ArticlePage(), binding: ArticleBinding()),
    GetPage(name: Routes.HOME_VIDEO, page: () => HomeVideoPage(), binding: HomeVideoBinding()),
    GetPage(name: Routes.VIDEO_INFO, page: () => HomeVideoInfoPage(), binding: VideoBinding()),
    GetPage(name: Routes.RECOMMEND, page: () => RecommendPage(), binding: RecommendBinding()),
  ];
}

//??????????????????
abstract class Routes {
  static const INITIAL = "/";

  //?????????
  static const SPLASH = "/splash";

  //??????
  static const MAIN = "/main";

  //??????
  static const HOME = "/home";

  //??????
  static const MUSIC = "/music";

  //?????????
  static const VIDEO = "/video";

  //??????
  static const MINE = "/mine";

  //??????
  static const RELEASE = "/release";

  //???????????????
  //??????
  static const SONG = "/song";

  //??????
  static const SINGER = "/singer";

  //?????????
  static const TINY_VIDEO = "/tiny_video";

  //??????
  static const ARTICLE = "/article";

  //??????
  static const HOME_VIDEO = "/home_video";

  //????????????
  static const VIDEO_INFO = "/video_info";

  //??????
  static const RECOMMEND = "/recommend";
}
