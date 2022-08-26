import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/keep_alive_widget.dart';
import '../music/music_page.dart';
import '../home/home_page.dart';

class MainController extends GetxController {
  int currentIndex = 0;
  var pageController = PageController(initialPage: 0);
  late List<Widget> pageViews;
  final Map<String, String> bottomNames = {
    'home': "首页",
    'music': "音乐",
    'create_media': "",
    'tiny_video': "小视频",
    'profile': "我的",
  };

  @override
  void onInit() {
    super.onInit();
    pageViews = [
      KeepAliveWidget(HomePage()),
      KeepAliveWidget(MusicPage()),
      KeepAliveWidget(Container()),
      KeepAliveWidget(HomePage()),
      KeepAliveWidget(MusicPage()),
    ];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onPushPage(int index) {
    if (index == 2) {
      onPushRelease();
    } else {
      pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.ease);
    }
    currentIndex = index;
    update();
  }

  void onPushRelease() {}
}
