import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/keep_alive_widget.dart';

class HomeController extends GetxController{

  List<Tab> tabs = [
    Tab(text: "歌曲"),
    Tab(text: "推荐"),
    Tab(text: "歌手"),
    Tab(text: "小视频"),
    Tab(text: "文章"),
    Tab(text: "视频"),
  ];

  late List<Widget> tabContents;

  @override
  void onInit() {
    super.onInit();
    tabContents = [
      KeepAliveWidget(Text("1111111")),
      KeepAliveWidget(Text("2222222")),
      KeepAliveWidget(Text("3333333")),
      KeepAliveWidget(Text("4444444")),
      KeepAliveWidget(Text("5555555")),
      KeepAliveWidget(Text("6666666")),
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

}
