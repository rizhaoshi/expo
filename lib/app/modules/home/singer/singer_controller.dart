import 'package:expo/app/models/user_model.dart';
import 'package:get/get.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../../../common/config/api_config.dart';
import '../../../services/user_service.dart';

class SingerController extends GetxController {
  late EasyRefreshController refreshController;
  List<UserItem> singers = UserList([]).list;
  int page = 1;
  int limit = Api.limit;
  bool hasMore = true;
  bool isError = false;
  String errorMag = "";

  @override
  void onInit() {
    super.onInit();
    refreshController = EasyRefreshController();
    getSingerList();
  }

  Future getSingerList({bool push = false}) async {
    try {
      //请求获取数据
      Map<String, dynamic> result = await UserService.getUserList(page: page, limit: limit);
      // 将数据转成实体类
      UserList userList = UserList.fromJson(result['data']);
      hasMore = page * limit < result['total'];
      page++;
      if (push) {
        singers.addAll(userList.list);
      } else {
        singers = userList.list;
      }
      isError = false;
      update(['home_singer_list_view']);
    } catch (e) {
      isError = true;
      errorMag = e.toString();
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onRefresh() async {
    page = 1;
    await getSingerList();
    refreshController.finishRefresh();
    refreshController.resetLoadState();
  }

  onLoad() async {
    if (hasMore) await getSingerList(push: true);
    refreshController.finishLoad(noMore: !hasMore);
  }
}
