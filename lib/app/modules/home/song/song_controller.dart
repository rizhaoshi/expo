import 'package:expo/app/models/song_model.dart';
import 'package:expo/app/services/song_service.dart';
import 'package:expo/common/config/api_config.dart';
import 'package:get/get.dart';

class SongController extends GetxController {
  List<SongItem> songs = SongList([]).list;
  int page = 1;
  int limit = Api.limit;
  bool hasMore = true;
  bool isError = false;
  String errorMag = "";

  @override
  void onInit() {
    super.onInit();
    getSongList();
  }

  Future getSongList({bool push = false}) async {
    try {
      //请求获取数据
      Map<String, dynamic> result = await SongService.getSongList(page: page, limit: limit);
      // 将数据转成实体类
      SongList songList = SongList.fromJson(result['data']);
      hasMore = page * limit < result['total'];
      page++;
      if (push) {
        songs.addAll(songList.list);
      } else {
        songs = songList.list;
      }
      isError = false;
      update(['home_song_list_view']);
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
}
