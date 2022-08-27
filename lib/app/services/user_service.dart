import 'package:expo/network/network.dart';

import '../../common/config/api_config.dart';

class UserService {
  static const String listUrl = Api.userListUrl;
  static const String infoUrl = Api.userInfoUrl;

  static Future getUserList({String type = "", int page = 1, int limit = 10}) async {
    final response = await Network.post(
      listUrl,
      data: {'page': page, 'limit': limit, 'type': type},
    );
    Map<String, dynamic> result = response['page'];
    return result;
  }
}
