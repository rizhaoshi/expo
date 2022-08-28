import 'package:expo/app/widgets/article_item_widget.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'article_controller.dart';

class ArticlePage extends GetView<ArticleController> {
  const ArticlePage({Key? key}) : super(key: key);

  Future _onRefresh() async {
    await controller.onRefresh();
  }

  Future _onLoad() async {
    await controller.onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleController>(
        id: 'home_article_list_view',
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
                  itemCount: controller.articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        const SizedBox(height: 5),
                        ArticleItemView(articleItem: controller.articles[index]),
                      ],
                    );
                  }));
        });
  }
}
