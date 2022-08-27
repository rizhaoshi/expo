import 'package:get/get.dart';

import 'singer_controller.dart';

class SingerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingerController>(
      () => SingerController(),
    );
  }
}
