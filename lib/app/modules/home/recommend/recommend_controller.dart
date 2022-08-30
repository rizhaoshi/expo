import 'package:expo/app/models/article_model.dart';
import 'package:expo/app/models/song_model.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import '../../../../common/config/api_config.dart';
import '../../../models/recommend_interface.dart';
import '../../../models/video_model.dart';
import '../../../services/recommend_service.dart';

class RecommendController extends GetxController {
  late EasyRefreshController refreshController;
  List<RecommendInterface?> recommends = [];
  int page = 1;
  int limit = Api.limit;
  bool hasMore = true;
  bool isError = false;
  String errorMag = "";

  @override
  void onInit() {
    super.onInit();
    refreshController = EasyRefreshController();
    getRecommendList();
  }

  Future getRecommendList({bool push = false}) async {
    try {
      //请求获取数据
      List<dynamic> result = await RecommendService.getRecommendList(page: page, limit: limit);
      Iterable<RecommendInterface?> recommendList = result.map((item) {
        if (item["songEntity"] != null) {
          return SongItem.fromJson(item["songEntity"]);
        } else if (item["articleEntity"] != null) {
          return ArticleItem.fromJson(item["articleEntity"]);
        } else if (item["videoEntity"] != null) {
          return VideoItem.fromJson(item["videoEntity"]);
        }
      }).toList();
      // 将数据转成实体类
      page++;
      if (push) {
        recommends.addAll(recommendList);
      } else {
        recommends.clear();
        recommends.addAll(recommendList);
      }
      isError = false;
      update(['home_recommend_list_view']);
    } catch (e) {
      isError = true;
      errorMag = e.toString();
      update();
    }
  }

  onRefresh() async {
    page = 1;
    await getRecommendList();
    refreshController.finishRefresh();
    refreshController.resetLoadState();
  }

  onLoad() async {
    await getRecommendList(push: true);
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
