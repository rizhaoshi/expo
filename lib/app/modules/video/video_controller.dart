import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/config/api_config.dart';
import '../../models/video_model.dart';
import '../../services/video_service.dart';

class VideoController extends GetxController {
  late PageController pageController;
  List<VideoItem> videos = VideoList([]).list;
  int page = 1;
  int limit = Api.limit;
  bool hasMore = true;
  bool loading = true;
  bool isError = false;
  String errorMag = "";

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    getVideoList();
  }

  Future getVideoList({bool push = false}) async {
    try {
      //请求获取数据
      Map<String, dynamic> result = await VideoService.getVideoList(page: page, limit: limit);
      print("=====$result=====");
      // 将数据转成实体类
      VideoList videoList = VideoList.fromJson(result['data']);
      print("=====$videoList=====");
      hasMore = page * limit < result['total'];
      page++;
      if (push) {
        videos.addAll(videoList.list);
      } else {
        videos = videoList.list;
      }
      isError = false;
    } catch (e) {
      isError = true;
      errorMag = e.toString();
    } finally {
      loading = false;
      update(["video_page"]);
    }
    loading = false;
    update(["video_page"]);
  }

  // 监听页面切换
  void onPageChanged(int index) {
    // 最后一个页面
    if (videos.length - 1 == index && hasMore) {
      getVideoList(push: false);
    }
  }

  onRefresh() async {
    page = 1;
    loading = true;
    isError = false;
    update(["video_page"]);
    await getVideoList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
