import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/home_page_head.dart';
import 'music_controller.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> with TickerProviderStateMixin {
  MusicController controller = Get.find<MusicController>();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: controller.tabs.length, vsync: this, initialIndex: 0)..addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HomePageHead(),
        bottom: TabBar(
          tabs: controller.tabs,
          controller: tabController,
          isScrollable: true,
        ),
        centerTitle: true,
      ),
      body: TabBarView(
        controller: tabController,
        children: controller.tabContents,
      ),
    );
  }
}
