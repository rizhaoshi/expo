import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:expo/app/widgets/song_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'song_controller.dart';

class SongPage extends GetView<SongController> {
  const SongPage({Key? key}) : super(key: key);

  Future _onRefresh() async {
    await controller.onRefresh();
  }

  Future _onLoad() async {
    await controller.onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SongController>(
        id: 'home_song_list_view',
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
                  itemCount: controller.songs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        const SizedBox(height: 5),
                        SongItemView(
                          songItem: controller.songs[index],
                        ),
                      ],
                    );
                  }));
        });
  }
}
