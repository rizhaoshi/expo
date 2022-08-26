import 'package:expo/utils/common_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expo/app/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  Widget _clipButton() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      child: Container(
        width: 50,
        height: 50,
        color: Colors.black.withOpacity(0.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("跳过", style: TextStyle(color: Colors.white, fontSize: 12)),
            Text("${controller.currentTime}s", style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            CommonUtils.getCommonImageByName("page"),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              right: 10,
              child: GetBuilder<SplashController>(
                id: 'splash_button',
                builder: (controller) {
                  return InkWell(
                    child: _clipButton(),
                    onTap: () {
                      controller.onPushMain();
                    },
                  );
                },
              )),
        ],
      ),
    );
  }
}
