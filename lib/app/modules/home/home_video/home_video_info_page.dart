import 'package:expo/app/widgets/full_screen_page.dart';
import 'package:expo/app/widgets/video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../video/video_controller.dart';

class HomeVideoInfoPage extends GetView<VideoController> {
  const HomeVideoInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FullScreenPage(
          height: 45.0,
          leadingIcon: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          actionIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.white,
              )),
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        VideoPlayerView(),
      ],
    );
  }
}
