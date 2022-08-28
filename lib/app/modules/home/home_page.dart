import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/home_page_head.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  HomeController controller = Get.find<HomeController>();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: controller.tabs.length, vsync: this, initialIndex: 1)..addListener(() {});
    getList();
  }

  void getList() async {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HomePageHead(),
        bottom: TabBar(
          tabs: controller.tabs,
          controller: tabController,
          // isScrollable: true,
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
