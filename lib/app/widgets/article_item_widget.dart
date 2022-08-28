import 'package:expo/app/models/article_model.dart';
import 'package:expo/app/widgets/avatar_role_name.dart';
import 'package:expo/app/widgets/comment_like_read.dart';
import 'package:expo/common/config/app_colors.dart';
import 'package:expo/utils/common_util.dart';
import 'package:flutter/material.dart';

class ArticleItemView extends StatelessWidget {
  final ArticleItem articleItem;

  const ArticleItemView({Key? key, required this.articleItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          _cover(),
          _bottom(),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(articleItem.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, color: AppColors.active));
  }

  Widget _cover() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FadeInImage.assetNetwork(
        placeholder: CommonUtils.getCommonImageByName("lazy_1"),
        image: articleItem.coverUrlList[1],
        fit: BoxFit.cover,
        width: 400,
        height: 400,
      ),
    );
  }

  Widget _bottom() {
    return Row(
      children: [
        Expanded(
            child: AvatarRoleName(
          avatar: articleItem.user.coverPictureUrl,
          nickname: articleItem.user.nickname,
          type: articleItem.user.type,
          showType: false,
        )),
        Expanded(
            child: CommentLikeRead(
          commentCount: articleItem.commentCount,
          thumbUpCount: articleItem.thumbUpCount,
          readCount: articleItem.readCount,
        ))
      ],
    );
  }
}
