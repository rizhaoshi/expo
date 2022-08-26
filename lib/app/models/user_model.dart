//用户列表模型
class UserList {
  final List<UserItem> list;

  UserList(this.list);

  factory UserList.fromJson(List<dynamic> list) {
    return UserList(list.map((item) => UserItem.fromJson(item)).toList());
  }
}

//用户详情数据模型
class UserItem {
  final int id;
  final String coverPictureUrl;
  final String nickname;
  final String type;
  final int musicCount;
  final int musicPlayCount;

  UserItem({
    required this.id,
    required this.coverPictureUrl,
    required this.nickname,
    required this.type,
    required this.musicCount,
    required this.musicPlayCount,
  });

  // 将 Json 数据转换为实体模型
  factory UserItem.fromJson(dynamic item) {
    return UserItem(
      id: item['id'],
      coverPictureUrl: item['coverPictureUrl'],
      nickname: item['nickname'],
      type: item['type'],
      musicCount: item['musicCount'],
      musicPlayCount: item['musicPlayCount'],
    );
  }
}
