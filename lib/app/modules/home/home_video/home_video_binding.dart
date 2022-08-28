import 'package:get/get.dart';
import 'home_video_controller.dart';

class HomeVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeVideoController>(
      () => HomeVideoController(),
    );
  }
}
