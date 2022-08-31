import 'package:expo/app/models/article_model.dart';
import 'package:expo/app/models/song_model.dart';
import 'package:expo/app/widgets/song_item_widget.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/recommend_interface.dart';
import '../../../models/video_model.dart';
import '../../../widgets/article_item_widget.dart';
import '../../../widgets/video_item_widget.dart';
import 'recommend_controller.dart';

class RecommendPage extends GetView<RecommendController> {
  const RecommendPage({Key? key}) : super(key: key);

  Future _onRefresh() async {
    await controller.onRefresh();
  }

  Future _onLoad() async {
    await controller.onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendController>(
        id: 'home_recommend_list_view',
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
                  itemCount: controller.recommends.length,
                  itemBuilder: (BuildContext context, int index) {
                    RecommendInterface? recommendItem = controller.recommends[index];
                    return getWidgetByInterface(recommendItem);
                  }));
        });
  }

  Widget getWidgetByInterface(RecommendInterface? interface) {
    if (interface == null) return const SizedBox.shrink();
    if (interface is SongItem) {
      return _columnBox(SongItemView(songItem: interface));
    } else if (interface is ArticleItem) {
      return _columnBox(ArticleItemView(articleItem: interface,onTap: (ArticleItem articleItem){
        controller.onPushArticleInfoPage(articleItem);
      },));
    } else if (interface is VideoItem) {
      return _columnBox(VideoItemView(
        videoItem: interface,
        onTap: (VideoItem videoItem) {
          controller.onPushVideoInfoPage(videoItem);
        },
      ));
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _columnBox(Widget itemView) {
    return Column(
      children: [
        const SizedBox(height: 8),
        itemView,
      ],
    );
  }
}
