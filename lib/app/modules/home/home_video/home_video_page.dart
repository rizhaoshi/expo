import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/video_item_widget.dart';
import 'home_video_controller.dart';

class HomeVideoPage extends GetView<HomeVideoController> {
  const HomeVideoPage({Key? key}) : super(key: key);

  Future _onRefresh() async {
    await controller.onRefresh();
  }

  Future _onLoad() async {
    await controller.onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVideoController>(
        id: 'home_video_list_view',
        builder: (ctr) {
          return EasyRefresh(
              onRefresh: _onRefresh,
              header: ClassicalHeader(),
              onLoad: _onLoad,
              footer: ClassicalFooter(),
              controller: controller.refreshController,
              enableControlFinishRefresh: true,
              enableControlFinishLoad: true,
              child: ListView.builder(
                  itemCount: controller.videos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        const SizedBox(height: 5),
                       VideoItemView(videoItem: controller.videos[index]),
                      ],
                    );
                  }));
        });
  }
}
