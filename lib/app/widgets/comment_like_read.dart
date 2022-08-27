import 'package:expo/common/config/app_colors.dart';
import 'package:expo/utils/common_util.dart';
import 'package:flutter/material.dart';

class CommentLikeRead extends StatelessWidget {
  final int? commentCount;
  final int? thumbUpCount;
  final int? readCount;

  const CommentLikeRead(
      {Key? key, this.commentCount, this.thumbUpCount, this.readCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _iconText('comment', commentCount),
        const SizedBox(width: 4),
        _iconText('like', thumbUpCount),
        const SizedBox(width: 4),
        _iconText('read', readCount),
      ],
    );
  }

  Widget _iconText(String icon, int? count) {
    return Expanded(
        child: Row(
      children: [
        Image.asset(
          CommonUtils.getImageAssetByName(icon),
          width: 14,
          height: 14,
        ),
        const SizedBox(width: 4),
        Expanded(
            child: Text(
          CommonUtils.formatCharCount(count),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: AppColors.un3active, fontSize: 10),
        ))
      ],
    ));
  }
}
