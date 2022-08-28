import 'package:get/get.dart';
import '../home/article/article_controller.dart';
import '../home/home_controller.dart';
import '../home/song/song_controller.dart';
import '../home/home_video/home_video_controller.dart';
import '../home/singer/singer_controller.dart';
import '../home/tiny_video/tiny_video_controller.dart';
import 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SongController>(
      () => SongController(),
    );
    Get.lazyPut<SingerController>(
      () => SingerController(),
    );
    Get.lazyPut<TinyVideoController>(
      () => TinyVideoController(),
    );
    Get.lazyPut<ArticleController>(
      () => ArticleController(),
    );
    Get.lazyPut<HomeVideoController>(
      () => HomeVideoController(),
    );
  }
}
