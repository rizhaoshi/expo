import 'package:expo/app/models/recommend_interface.dart';
import 'package:expo/app/models/user_model.dart';

//歌曲列表模型
class SongList {
  final List<SongItem> list;

  SongList(this.list);

  factory SongList.fromJson(List<dynamic> list) {
    return SongList(list.map((item) => SongItem.fromJson(item)).toList());
  }
}

//歌曲详情数据模型
class SongItem implements RecommendInterface {
  final int id;
  final int userId;
  final UserItem user; // 这个是用户模型
  final String coverPictureUrl;
  final String songUrl;
  final String cnName;
  final String enName;
  final int commentCount;
  final int thumbUpCount;
  final int readCount;

  SongItem({
    required this.id,
    required this.userId,
    required this.user,
    required this.coverPictureUrl,
    required this.songUrl,
    required this.cnName,
    required this.enName,
    required this.commentCount,
    required this.thumbUpCount,
    required this.readCount,
  });

  factory SongItem.fromJson(dynamic item) {
    return SongItem(
      id: item['id'],
      userId: item['userId'],
      user: UserItem.fromJson(item['user']),
      coverPictureUrl: item['coverPictureUrl'],
      songUrl: item['songUrl'],
      cnName: item['cnName'],
      enName: item['enName'],
      commentCount: item['commentCount'],
      thumbUpCount: item['thumbUpCount'],
      readCount: item['readCount'],
    );
  }
}
