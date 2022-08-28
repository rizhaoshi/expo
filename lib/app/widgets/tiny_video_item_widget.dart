import 'package:expo/app/models/video_model.dart';
import 'package:expo/app/widgets/avatar_role_name.dart';
import 'package:expo/app/widgets/comment_like_read.dart';
import 'package:expo/utils/common_util.dart';
import 'package:flutter/material.dart';

class TinyVideoItemView extends StatelessWidget {
  final VideoItem videoItem;

  const TinyVideoItemView({Key? key, required this.videoItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _cover(),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: AvatarRoleName(
              avatar: videoItem.user.coverPictureUrl,
              nickname: videoItem.user.nickname,
              showType: false,
              type: videoItem.user.type,
            )),
        CommentLikeRead(
          commentCount: videoItem.commentCount,
          thumbUpCount: videoItem.thumbUpCount,
          readCount: videoItem.readCount,
        ),
      ],
    );
  }

  Widget _cover() {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.assetNetwork(
              placeholder: CommonUtils.getCommonImageByName("lazy_3"),
              image: videoItem.coverPictureUrl,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Image.asset(
              CommonUtils.getImageAssetByName("play_plus"),
              width: 32,
              height: 32,
            ),
          ),
        ],
      ),
    );
  }
}
