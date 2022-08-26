import 'package:expo/app/modules/home/home_controller.dart';
import 'package:expo/app/modules/home/song/song_controller.dart';
import 'package:get/get.dart';

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
  }
}
