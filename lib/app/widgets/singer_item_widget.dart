import 'package:expo/common/config/app_colors.dart';
import 'package:expo/utils/common_util.dart';
import 'package:flutter/material.dart';

class SingerItemView extends StatelessWidget {
  final String coverPictureUrl;
  final String? nickname;
  final int? musicCount;
  final int? musicPlayCount;

  const SingerItemView({Key? key,
    required this.coverPictureUrl,
    this.nickname,
    this.musicCount = 0,
    this.musicPlayCount = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                  placeholder: CommonUtils.getCommonImageByName("lazy_1"),
                  image: coverPictureUrl,
                  fit: BoxFit.cover,
                ))),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              nickname ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: AppColors.active, fontSize: 16),
            )),
        Row(
          children: [
            _iconText("read", "歌曲", musicCount!),
            _iconText("read", "播放", musicPlayCount!),
          ],
        )
      ],
    );
  }

  Widget _iconText(String icon, String label, int count) {
    return Expanded(
        child: Row(
          children: [
            Image.asset(
              CommonUtils.getImageAssetByName(icon),
              width: 18,
              height: 18,
            ),
            Text(
              maxLines: 1,
              "$label: ${CommonUtils.formatCharCount(count)}",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: AppColors.un3active, fontSize: 12),
            )
          ],
        ));
  }
}
