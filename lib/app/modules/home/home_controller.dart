import 'package:expo/app/modules/home/article/article_page.dart';
import 'package:expo/app/modules/home/home_video/home_video_page.dart';
import 'package:expo/app/modules/home/recommend/recommend_page.dart';
import 'package:expo/app/modules/home/tiny_video/tiny_video_page.dart';
import 'package:flutter/material.dart';
import 'package:expo/app/modules/home/singer/singer_page.dart';
import 'package:expo/app/modules/home/song/song_page.dart';
import 'package:get/get.dart';
import '../../widgets/keep_alive_widget.dart';

class HomeController extends GetxController {
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
      KeepAliveWidget(SongPage()),
      KeepAliveWidget(RecommendPage()),
      KeepAliveWidget(SingerPage()),
      KeepAliveWidget(TinyVideoPage()),
      KeepAliveWidget(ArticlePage()),
      KeepAliveWidget(HomeVideoPage()),
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
