import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/singer_item_widget.dart';
import 'singer_controller.dart';

class SingerPage extends GetView<SingerController> {
  const SingerPage({Key? key}) : super(key: key);

  Future _onRefresh() async {
    await controller.onRefresh();
  }

  Future _onLoad() async {
    await controller.onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingerController>(
        id: 'home_singer_list_view',
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
                itemCount: controller.singers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(top: 10, left: index.isEven ? 18 : 9, right: index.isEven ? 9 : 18),
                    color: Colors.white,
                    child: SingerItemView(
                      coverPictureUrl: controller.singers[index].coverPictureUrl,
                      nickname: controller.singers[index].nickname,
                      musicCount: controller.singers[index].musicCount,
                      musicPlayCount: controller.singers[index].musicPlayCount,
                    ),
                  );
                },
                padding: const EdgeInsets.only(top: 5),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: MediaQuery.of(context).size.width / 1.5,
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 1,
                ),
              ));
        });
  }
}
