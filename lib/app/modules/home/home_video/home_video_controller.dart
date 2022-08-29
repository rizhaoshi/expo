import 'package:expo/app/models/video_model.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:expo/common/config/api_config.dart';
import 'package:get/get.dart';
import '../../../services/video_service.dart';

class HomeVideoController extends GetxController {
  late EasyRefreshController refreshController;
  List<VideoItem> videos = VideoList([]).list;
  int page = 1;
  int limit = Api.limit;
  bool hasMore = true;
  bool isError = false;
  String errorMag = "";

  @override
  void onInit() {
    super.onInit();
    refreshController = EasyRefreshController();
    getVideoList();
  }

  Future getVideoList({bool push = false}) async {
    try {
      //请求获取数据
      Map<String, dynamic> result = await VideoService.getVideoList(page: page, limit: limit);
      // 将数据转成实体类
      VideoList videoList = VideoList.fromJson(result['data']);
      hasMore = page * limit < result['total'];
      page++;
      if (push) {
        videos.addAll(videoList.list);
      } else {
        videos = videoList.list;
      }
      isError = false;
      update(['home_video_list_view']);
    } catch (e) {
      isError = true;
      errorMag = e.toString();
      update();
    }
  }

  onRefresh() async {
    page = 1;
    await getVideoList();
    refreshController.finishRefresh();
    refreshController.resetLoadState();
  }

  onLoad() async {
    if (hasMore) await getVideoList(push: true);
    refreshController.finishLoad(noMore: !hasMore);
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
