import 'package:expo/utils/common_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_controller.dart';

class MainPage extends GetView<MainController> {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onTabClick(int index) {
      if (index == 2) {
        controller.onPushPage(index, context: context, child: _createRippleBackdrop());
      } else {
        controller.onPushPage(index, child: Container(), context: context);
      }
    }

    final List<BottomNavigationBarItem> _bottomNavBars = [];
    controller.bottomNames.forEach((key, value) {
      _bottomNavBars.add(_bottomNavBatItem(key, value));
    });

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: controller.pageViews,
      ),
      bottomNavigationBar: GetBuilder<MainController>(
        builder: (controller) {
          return BottomNavigationBar(
            onTap: _onTabClick,
            items: _bottomNavBars,
            currentIndex: controller.currentIndex,
            type: BottomNavigationBarType.fixed,
          );
        },
      ),
      floatingActionButton: _createMediaButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _createRippleBackdrop() {
    return Container(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [IconButton(onPressed: () {}, icon: const Icon(Icons.image)), IconButton(onPressed: () {}, icon: const Icon(Icons.video_call))],
        ));
  }

  Widget _createMediaButton(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      margin: const EdgeInsets.only(top: 54),
      child: FloatingActionButton(
          onPressed: () {
            controller.onPushPage(2, context: context, child: _createRippleBackdrop());
          },
          child: Image.asset(
            CommonUtils.getImageAssetByName("create_media"),
          )),
    );
  }

  BottomNavigationBarItem _bottomNavBatItem(String key, String value) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          CommonUtils.getImageAssetByName(key),
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          CommonUtils.getImageAssetByName("${key}_active"),
          width: 24,
          height: 24,
        ),
        label: value,
        tooltip: "");
  }
}
