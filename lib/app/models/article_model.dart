import 'package:expo/app/models/recommend_interface.dart';
import 'package:expo/app/models/user_model.dart';

//文章列表模型
class ArticleList {
  final List<ArticleItem> list;

  ArticleList(this.list);

  factory ArticleList.fromJson(List<dynamic> list) {
    return ArticleList(list.map((item) => ArticleItem.fromJson(item)).toList());
  }
}

//文章详情数据模型
class ArticleItem implements RecommendInterface{
  final int id;
  final int userId;
  final UserItem user; // 这个是用户模型
  final List coverUrlList;
  final String title;
  final int commentCount;
  final int thumbUpCount;
  final int readCount;

  ArticleItem({
    required this.id,
    required this.userId,
    required this.user,
    required this.coverUrlList,
    required this.title,
    required this.commentCount,
    required this.thumbUpCount,
    required this.readCount,
  });

  factory ArticleItem.fromJson(dynamic item) {
    return ArticleItem(
      id: item['id'],
      userId: item['userId'],
      user: UserItem.fromJson(item['user']),
      coverUrlList: item['coverUrlList'],
      title: item['title'],
      commentCount: item['commentCount'],
      thumbUpCount: item['thumbUpCount'],
      readCount: item['readCount'],
    );
  }
}
