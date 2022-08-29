import 'package:expo/network/network.dart';

import '../../common/config/api_config.dart';

class RecommendService {
  static const String listUrl = Api.recommendListUrl;

  static Future getRecommendList({int page = 1, int limit = 10}) async {
    final response = await Network.post(
      listUrl,
      data: {'page': page, 'limit': limit},
    );
    List<dynamic> result = response['page'];
    return result;
  }
}
