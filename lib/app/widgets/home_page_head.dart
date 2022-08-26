import 'package:expo/utils/common_util.dart';
import 'package:flutter/material.dart';

import '../../common/config/app_colors.dart';

class HomePageHead extends StatelessWidget {
  const HomePageHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(CommonUtils.getCommonImageByName("logo"), height: 40),
        Expanded(child: _searchContent()),
        Image.asset(CommonUtils.getImageAssetByName("msg"), height: 30),
      ],
    );
  }

  Widget _searchContent() {
    return Container(
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(color: AppColors.page, borderRadius: BorderRadius.circular(30)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Padding(padding: EdgeInsets.only(left: 8, right: 4), child: Icon(Icons.search, size: 18, color: AppColors.un3active)),
          Text("搜索关键词", style: TextStyle(fontSize: 13, color: AppColors.un3active))
        ],
      ),
    );
  }
}
