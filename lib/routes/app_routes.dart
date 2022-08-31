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
    GetPage(name: Routes.VIDEO, page: () => VideoPage(), binding: VideoBinding()),
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

//命名路由名称
abstract class Routes {
  static const INITIAL = "/";

  //启动页
  static const SPLASH = "/splash";

  //主页
  static const MAIN = "/main";

  //首页
  static const HOME = "/home";

  //音乐
  static const MUSIC = "/music";

  //小视频
  static const VIDEO = "/video";

  //我的
  static const MINE = "/mine";

  //发布
  static const RELEASE = "/release";

  //首页频道页
  //歌曲
  static const SONG = "/song";

  //歌手
  static const SINGER = "/singer";

  //小视频
  static const TINY_VIDEO = "/tiny_video";

  //文章
  static const ARTICLE = "/article";

  //视频
  static const HOME_VIDEO = "/home_video";

  //视频详情
  static const VIDEO_INFO = "/video_info";

  //推荐
  static const RECOMMEND = "/recommend";
}
