import 'package:expo/app/models/article_model.dart';
import 'package:expo/app/widgets/web_view_page.dart';
import 'package:expo/common/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleInfoPage extends StatelessWidget {
  final ArticleItem articleItem;

  const ArticleInfoPage({Key? key, required this.articleItem}) : super(key: key);

  _onAction() {
    Get.bottomSheet(
        const SizedBox(
          height: 200,
          child: Center(child: Text("分享")),
        ),
        backgroundColor: AppColors.nav,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(16),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
              onPressed: _onAction,
              icon: const Icon(Icons.more_horiz),
            )
          ],
          title: Text(
            articleItem.title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        body: WebViewPage(initialUrl: 'https://mp.duuchin.com/duuchin-article/index.html?id=${articleItem.id}'));
  }
}
