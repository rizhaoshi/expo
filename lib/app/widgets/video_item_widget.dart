import 'package:expo/app/widgets/avatar_role_name.dart';
import 'package:expo/app/widgets/comment_like_read.dart';
import 'package:expo/common/config/app_colors.dart';
import 'package:expo/utils/common_util.dart';
import 'package:expo/utils/date_util.dart';
import 'package:flutter/material.dart';
import '../models/video_model.dart';

class VideoItemView extends StatefulWidget {
  final VideoItem videoItem;

  const VideoItemView({Key? key, required this.videoItem}) : super(key: key);

  @override
  State<VideoItemView> createState() => _VideoItemViewState();
}

const double paddingSize = 20;
const double spaceSize = 10;

class _VideoItemViewState extends State<VideoItemView> {
  late double boxSize;

  @override
  Widget build(BuildContext context) {
    boxSize = MediaQuery.of(context).size.width - paddingSize * 2;
    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          const SizedBox(height: 10),
          _cover(),
          const SizedBox(height: 10),
          _bottom(),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(widget.videoItem.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, color: AppColors.active));
  }

  Widget _cover() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage.assetNetwork(
                placeholder: CommonUtils.getCommonImageByName("lazy_2"),
                image: widget.videoItem.coverPictureUrl,
                fit: BoxFit.cover,
              )),
          Center(
              child: Image.asset(
            CommonUtils.getImageAssetByName("play_plus"),
            width: 40,
            height: 40,
          )),
          Positioned(
              right: 10,
              bottom: 10,
              child: Container(
                padding:const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.4), borderRadius: BorderRadius.circular(4)),
                child: Text(
                  DateUtil.secondsToTime(widget.videoItem.contentSeconds),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ))
        ],
      ),
    );
  }

  Widget _bottom() {
    return Row(
      children: [
        Expanded(
            child: AvatarRoleName(
          avatar: widget.videoItem.user.coverPictureUrl,
          nickname: widget.videoItem.user.nickname,
          type: widget.videoItem.user.type,
          showType: false,
        )),
        Expanded(
            child: CommentLikeRead(
          commentCount: widget.videoItem.commentCount,
          thumbUpCount: widget.videoItem.thumbUpCount,
          readCount: widget.videoItem.readCount,
        ))
      ],
    );
  }
}
