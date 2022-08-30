import 'package:expo/app/models/recommend_interface.dart';
import 'package:expo/app/models/user_model.dart';

//视频列表模型
class VideoList {
  final List<VideoItem> list;

  VideoList(this.list);

  factory VideoList.fromJson(List<dynamic> list) {
    return VideoList(list.map((item) => VideoItem.fromJson(item)).toList());
  }
}

//视频详情数据模型
class VideoItem implements RecommendInterface {
  final int id;
  final int userId;
  final UserItem user; // 这个是用户模型
  final String coverPictureUrl;
  final String videoUrl;
  final String title;
  final String intro;
  final int commentCount;
  final int thumbUpCount;
  final int readCount;
  final int shareCount;
  final int contentSeconds;

  VideoItem({
    required this.id,
    required this.userId,
    required this.user,
    required this.coverPictureUrl,
    required this.videoUrl,
    required this.title,
    required this.intro,
    required this.commentCount,
    required this.thumbUpCount,
    required this.readCount,
    required this.shareCount,
    required this.contentSeconds,
  });

  factory VideoItem.fromJson(dynamic item) {
    return VideoItem(
      id: item['id'],
      userId: item['userId'],
      user: UserItem.fromJson(item['user']),
      coverPictureUrl: item['coverPictureUrl'],
      videoUrl: item['videoUrl'],
      title: item['title'],
      intro: item['intro'],
      commentCount: item['commentCount'],
      thumbUpCount: item['thumbUpCount'],
      readCount: item['readCount'],
      shareCount: item['shareCount'],
      contentSeconds: item['contentSeconds'],
    );
  }
}

// 详情模型
class TinyVideoInfo {
  final int id;
  final String coverPictureUrl;
  final int commentCount;
  final int thumbUpCount;
  final int readCount;
  final String videoUrl;
  final String intro;
  final bool thumbUp;

  TinyVideoInfo({
    required this.id,
    required this.coverPictureUrl,
    required this.commentCount,
    required this.thumbUpCount,
    required this.readCount,
    required this.videoUrl,
    required this.intro,
    required this.thumbUp,
  });

  factory TinyVideoInfo.fromJson(Map<String, dynamic> info) {
    return TinyVideoInfo(
      id: info['id'],
      coverPictureUrl: info['coverPictureUrl'],
      commentCount: info['commentCount'],
      thumbUpCount: info['thumbUpCount'],
      readCount: info['readCount'],
      videoUrl: info['videoUrl'],
      intro: info['intro'],
      thumbUp: info['thumbUp'],
    );
  }
}
