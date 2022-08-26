import 'package:expo/network/network.dart';

import '../../common/config/api_config.dart';

class SongService {
  static const String listUrl = Api.songListUrl;
  static const String infoUrl = Api.songInfoUrl;

  static Future getSongList({int page = 1, int limit = 10}) async {
    final response = await Network.post(
      listUrl,
      data: {'page': page, 'limit': limit},
    );
    Map<String, dynamic> result = response['page'];
    return result;
  }
}
