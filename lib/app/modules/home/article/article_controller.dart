import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:expo/common/config/api_config.dart';
import '../../../models/article_model.dart';
import '../../../services/article_service.dart';
import 'package:get/get.dart';

class ArticleController extends GetxController {
  late EasyRefreshController refreshController;
  List<ArticleItem> articles = ArticleList([]).list;
  int page = 1;
  int limit = Api.limit;
  bool hasMore = true;
  bool isError = false;
  String errorMag = "";

  @override
  void onInit() {
    super.onInit();
    refreshController = EasyRefreshController();
    getArticleList();
  }

  Future getArticleList({bool push = false}) async {
    try {
      //请求获取数据
      Map<String, dynamic> result = await ArticleService.getArticleList(page: page, limit: limit);
      // 将数据转成实体类
      ArticleList articleList = ArticleList.fromJson(result['data']);
      hasMore = page * limit < result['total'];
      page++;
      if (push) {
        articles.addAll(articleList.list);
      } else {
        articles = articleList.list;
      }
      isError = false;
      update(['home_article_list_view']);
    } catch (e) {
      isError = true;
      errorMag = e.toString();
      update();
    }
  }

  onRefresh() async {
    page = 1;
    await getArticleList();
    refreshController.finishRefresh();
    refreshController.resetLoadState();
  }

  onLoad() async {
    if (hasMore) await getArticleList(push: true);
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
