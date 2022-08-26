import 'package:get/get.dart';

import '../app/modules/home/home_binding.dart';
import '../app/modules/home/home_page.dart';
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
}
