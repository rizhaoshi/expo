import 'package:flutter/material.dart';

class CommonUtils {
  static String getCommonImageByName(String imageName) {
    return 'assets/images/common/' + imageName + ".png";
  }

  static String getImageAssetByName(String imageName) {
    return 'assets/images/icons/' + imageName + ".png";
  }

  //转为rpx
  static double toRpx(BuildContext context, double size) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return size * rpx;
  }
}
