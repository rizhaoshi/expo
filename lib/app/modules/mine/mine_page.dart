import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'mine_controller.dart';

class MinePage extends GetView<MineController> {
  const MinePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mine'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MinePage',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
