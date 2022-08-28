import 'package:expo/network/network.dart';

import '../../common/config/api_config.dart';

class ArticleService {
  static const String listUrl = Api.articleListUrl;
  static const String infoUrl = Api.articleInfoUrl;

  static Future getArticleList({int page = 1, int limit = 10}) async {
    final response = await Network.post(
      listUrl,
      data: {'page': page, 'limit': limit},
    );
    Map<String, dynamic> result = response['page'];
    return result;
  }
}
