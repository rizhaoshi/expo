import 'package:expo/common/config/app_colors.dart';
import 'package:expo/utils/common_util.dart';
import 'package:flutter/material.dart';

class ActionsToolbar extends StatefulWidget {
  final int? commentCount;
  final int? thumbUpCount;
  final int? shareCount;
  final bool thumbUp;
  final String userAvatar;
  final AnimationController animationController;

  const ActionsToolbar({
    Key? key,
    this.commentCount,
    this.thumbUpCount,
    this.shareCount,
    this.thumbUp = false,
    required this.userAvatar,
    required this.animationController,
  }) : super(key: key);

  @override
  State<ActionsToolbar> createState() => _ActionsToolbarState();
}

class _ActionsToolbarState extends State<ActionsToolbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _avatar(),
        SizedBox(height: CommonUtils.toRpx(context, 20)),
        _iconText(icon: CommonUtils.getImageAssetByName("heart"), count: widget.thumbUpCount ?? 0, thumbUp: widget.thumbUp),
        SizedBox(height: CommonUtils.toRpx(context, 20)),
        _iconText(icon: CommonUtils.getImageAssetByName("comment2"), count: widget.commentCount ?? 0),
        SizedBox(height: CommonUtils.toRpx(context, 20)),
        _iconText(icon: CommonUtils.getImageAssetByName("share"), count: widget.shareCount ?? 0),
        SizedBox(height: CommonUtils.toRpx(context, 40)),
        _rotate(),
      ],
    );
  }

  Widget _avatar() {
    return Container(
      width: CommonUtils.toRpx(context, 90),
      height: CommonUtils.toRpx(context, 160),
      child: Stack(
        children: [
          Container(
            width: CommonUtils.toRpx(context, 90),
            height: CommonUtils.toRpx(context, 90),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CommonUtils.toRpx(context, 90)),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: ClipOval(
              child: FadeInImage.assetNetwork(
                placeholder: CommonUtils.getCommonImageByName("lazy_1"),
                image: widget.userAvatar,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: CommonUtils.toRpx(context, 38),
              height: CommonUtils.toRpx(context, 38),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(CommonUtils.toRpx(context, 38)), color: AppColors.danger),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //点赞 评论  ...
  Widget _iconText({required String icon, int count = 0, bool thumbUp = false}) {
    return Column(
      children: [
        Image.asset(
          icon,
          width: CommonUtils.toRpx(context, 70),
          height: CommonUtils.toRpx(context, 70),
          color: thumbUp ? AppColors.danger : Colors.white,
        ),
        const SizedBox(height: 4),
        Text(CommonUtils.formatCharCount(count),
            style: TextStyle(
              color: Colors.white,
              fontSize: CommonUtils.toRpx(context, 26),
            ))
      ],
    );
  }

  Widget _rotate() {
    return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(widget.animationController),
        child: Container(
          width: CommonUtils.toRpx(context, 90),
          height: CommonUtils.toRpx(context, 90),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(CommonUtils.getCommonImageByName("bgm")), fit: BoxFit.cover),
          ),
          child: ClipOval(
            child: FadeInImage.assetNetwork(
              placeholder: CommonUtils.getCommonImageByName("lazy_1"),
              image: widget.userAvatar,
              width: CommonUtils.toRpx(context, 50),
              height: CommonUtils.toRpx(context, 50),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
