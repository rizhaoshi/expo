import 'package:expo/utils/common_util.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class VideoIntro extends StatelessWidget {
  final String nickname;
  final String intro;

  const VideoIntro({Key? key, required this.nickname, required this.intro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("@$nickname",
            style: TextStyle(
              color: Colors.white,
              fontSize: CommonUtils.toRpx(context, 30),
              fontWeight: FontWeight.w600,
            )),
        SizedBox(height: CommonUtils.toRpx(context, 5)),
        Text(intro,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: CommonUtils.toRpx(context, 26),
            )),
        SizedBox(height: CommonUtils.toRpx(context, 5)),
        Row(
          children: [
            Image.asset(
              CommonUtils.getCommonImageByName("music"),
              width: CommonUtils.toRpx(context, 36),
              height: CommonUtils.toRpx(context, 36),
              color: Colors.white,
            ),
            SizedBox(height: CommonUtils.toRpx(context, 5)),
            SizedBox(
              width: CommonUtils.toRpx(context, 370),
              height: CommonUtils.toRpx(context, 36),
              child: Marquee(
                text: "@$nickname创作的原声",
                style: TextStyle(color: Colors.white, fontSize: CommonUtils.toRpx(context, 26)),
                scrollAxis: Axis.horizontal,
                blankSpace: CommonUtils.toRpx(context, 30),
                velocity: 40.0,
                fadingEdgeEndFraction: 0.1,
                fadingEdgeStartFraction: 0.1,
              ),
            )
          ],
        )
      ],
    );
  }
}
