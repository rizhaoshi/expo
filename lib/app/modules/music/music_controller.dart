import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/keep_alive_widget.dart';
import '../home/singer/singer_page.dart';
import '../home/song/song_page.dart';

class MusicController extends GetxController {
  List<Tab> tabs = [
    Tab(text: "歌曲"),
    Tab(text: "歌手"),
  ];

  late List<Widget> tabContents;

  @override
  void onInit() {
    super.onInit();
    tabContents = [
      KeepAliveWidget(SongPage()),
      KeepAliveWidget(SingerPage()),
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
