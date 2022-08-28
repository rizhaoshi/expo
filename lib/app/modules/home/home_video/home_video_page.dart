import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_video_controller.dart';

class HomeVideoPage extends GetView<HomeVideoController> {
  const HomeVideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeVideoView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeVideoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
