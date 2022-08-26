import 'package:get/get.dart';

import 'song_controller.dart';

class SongBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SongController>(
          () => SongController(),
    );
  }
}
