import 'package:expo/app/models/song_model.dart';
import 'package:expo/app/widgets/avatar_role_name.dart';
import 'package:expo/app/widgets/comment_like_read.dart';
import 'package:expo/common/config/app_colors.dart';
import 'package:expo/utils/common_util.dart';
import 'package:flutter/material.dart';

class SongItemView extends StatelessWidget {
  final SongItem songItem;

  SongItemView({Key? key, required this.songItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(CommonUtils.toRpx(context, 20)),
      child: Row(
        children: [
          _songCover(),
          const SizedBox(width: 8),
          _songContent(),
        ],
      ),
    );
  }

  Widget _songContent() {
    return Expanded(
        child: SizedBox(
      height: 75,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Text(
            songItem.cnName,
            style: const TextStyle(color: AppColors.active, fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Positioned(
              top: 25,
              child: Text(
                songItem.enName,
                style: const TextStyle(color: AppColors.un3active, fontSize: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: AvatarRoleName(
                    avatar: songItem.user.coverPictureUrl,
                    nickname: songItem.user.nickname,
                    // showType: false,
                    // type: "NORMAL_USER",
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                    child: CommentLikeRead(
                  commentCount: songItem.commentCount,
                  thumbUpCount: songItem.thumbUpCount,
                  readCount: songItem.readCount,
                ))
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _songCover() {
    return SizedBox(
      width: 75,
      height: 75,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage.assetNetwork(
                placeholder: CommonUtils.getCommonImageByName("lazy_1"),
                image: songItem.coverPictureUrl,
                fit: BoxFit.cover,
              )),
          Center(
            child: Image.asset(
              CommonUtils.getImageAssetByName("tiny_video"),
              width: 22,
              height: 22,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
