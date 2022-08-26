import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'music_controller.dart';

class MusicPage extends GetView<MusicController> {
  const MusicPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MusicPage',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
