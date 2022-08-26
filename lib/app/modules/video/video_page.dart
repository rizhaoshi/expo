import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'video_controller.dart';

class VideoPage extends GetView<VideoController> {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VideoPage',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
