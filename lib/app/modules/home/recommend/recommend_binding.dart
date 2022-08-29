import 'package:get/get.dart';
import 'recommend_controller.dart';

class RecommendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecommendController>(
      () => RecommendController(),
    );
  }
}
