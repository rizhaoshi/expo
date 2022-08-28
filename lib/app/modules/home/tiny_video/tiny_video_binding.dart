import 'package:get/get.dart';
import 'tiny_video_controller.dart';

class TinyVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TinyVideoController>(
      () => TinyVideoController(),
    );
  }
}
