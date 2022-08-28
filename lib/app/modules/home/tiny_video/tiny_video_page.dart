import 'package:expo/app/widgets/tiny_video_item_widget.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'tiny_video_controller.dart';

class TinyVideoPage extends GetView<TinyVideoController> {
  const TinyVideoPage({Key? key}) : super(key: key);

  Future _onRefresh() async {
    await controller.onRefresh();
  }

  Future _onLoad() async {
    await controller.onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TinyVideoController>(
        id: 'tiny_video_grid_view',
        builder: (ctr) {
          return EasyRefresh(
              onRefresh: _onRefresh,
              header: ClassicalHeader(),
              onLoad: _onLoad,
              footer: ClassicalFooter(),
              controller: controller.refreshController,
              enableControlFinishRefresh: true,
              enableControlFinishLoad: true,
              child: GridView.builder(
                itemCount: controller.videos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(top: 10, left: index.isEven ? 18 : 9, right: index.isEven ? 9 : 18),
                    color: Colors.white,
                    child: TinyVideoItemView(
                      videoItem: controller.videos[index],
                    ),
                  );
                },
                padding: const EdgeInsets.only(top: 5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 1,
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 2,
                ),
              ));
        });
  }
}
