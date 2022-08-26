import 'dart:async';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  int currentTime = 6;
  late Timer time;

  @override
  void onInit() {
    super.onInit();
    time = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      currentTime--;
      if (currentTime <= 0) {
        onPushMain();
      }
      update(['splash_button']);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onPushMain() {
    time.cancel();
    Get.offAndToNamed(Routes.MAIN);
  }
}
