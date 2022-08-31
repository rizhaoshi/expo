import 'package:expo/utils/common_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/home/home_video/video_info_state.dart';
import '../../modules/video/video_controller.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatelessWidget {
  final VideoController controller = Get.find<VideoController>();

  // 基于控制器查找状态层
  final VideoInfoState videoInfoState = Get.find<VideoController>().state;

  VideoPlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _playerBox(children: [
      _buildVideo(
        child: VideoPlayer(videoInfoState.playerController),
        onTap: controller.onPlayOrPause,
      ),
      _playIcon(context: context, onTap: controller.onPlayOrPause),
      _loading(),
    ]);
  }

  Widget _playerBox({List<Widget> children = const <Widget>[]}) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        children: children,
      ),
    );
  }

  Widget _buildVideo({required Widget child, required GestureTapCallback onTap}) {
    return FutureBuilder(
        future: videoInfoState.playerFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GestureDetector(
              onTap: controller.onPlayOrPause,
              child: child,
            );
          } else {
            return FadeInImage.assetNetwork(
                placeholder: CommonUtils.getCommonImageByName('lazy_2'), image: videoInfoState.videoItem.coverPictureUrl, fit: BoxFit.cover);
          }
        });
  }

  Widget _playIcon({required BuildContext context, GestureTapCallback? onTap}) {
    if (videoInfoState.playerController.value.isInitialized && !videoInfoState.playerController.value.isPlaying) {
      return Center(
        child: GestureDetector(
            onTap: onTap,
            child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  CommonUtils.getImageAssetByName("play_plus"),
                  width: CommonUtils.toRpx(context, 100),
                  height: CommonUtils.toRpx(context, 100),
                ))),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _loading() {
    if (videoInfoState.playerController.value.isBuffering) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const SizedBox.shrink();
  }
}
